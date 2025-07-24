#!/usr/bin/env bash

echo "Configuring iStat Menus..."

# Function to import iStat Menus settings
import_istat_settings() {
    local settings_file="$1"
    local has_license="$2"

    echo "Importing iStat Menus configuration from $(basename "$settings_file")..."

    # Use the 'open' command to import the settings
    if open "$settings_file"; then
        echo "iStat Menus settings file opened successfully!"
        echo "iStat Menus should now import the settings automatically."

        if [ "$has_license" = "true" ]; then
            echo "✓ License information included - you're all set!"
        else
            echo "ℹ️  Note: License information not included"
            echo "   You can add your license manually in iStat Menus preferences"
        fi

        echo "You may see an import dialog - please confirm the import when prompted."
        return 0
    else
        echo "Error: Could not open $(basename "$settings_file")"
        echo "Make sure iStat Menus is installed via brew (istat-menus@6)"
        return 1
    fi
}

# Try licensed version first (from personalized GitHub Actions branch)
LICENSED_SETTINGS="$(dirname "$0")/istat-menus-settings-licensed.ismp"
SANITIZED_SETTINGS="$(dirname "$0")/istat-menus-settings.ismp"

if [ -f "$LICENSED_SETTINGS" ]; then
    # Licensed version found (likely from personalized branch)
    import_istat_settings "$LICENSED_SETTINGS" "true"
elif [ -f "$SANITIZED_SETTINGS" ]; then
    # Sanitized version found (main branch)
    import_istat_settings "$SANITIZED_SETTINGS" "false"
else
    # No local files found, try remote download
    echo "Local iStat Menus settings not found, trying remote..."

    # First try to get licensed version (from personalized branch if available)
    TEMP_LICENSED="/tmp/istat-menus-settings-licensed.ismp"
    TEMP_SANITIZED="/tmp/istat-menus-settings.ismp"

    # Try licensed version first (this will fail if no personalized branch exists)
    if curl -fsSL "https://raw.githubusercontent.com/yon/osx-bootstrap/personalized-$(date +%Y%m%d)/preferences/istat-menus-settings-licensed.ismp" -o "$TEMP_LICENSED" 2>/dev/null; then
        echo "Found personalized settings with license"
        if import_istat_settings "$TEMP_LICENSED" "true"; then
            rm "$TEMP_LICENSED"
        else
            rm "$TEMP_LICENSED"
            exit 1
        fi
    # Fall back to sanitized version from main branch
    elif curl -fsSL "https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/istat-menus-settings.ismp" -o "$TEMP_SANITIZED"; then
        echo "Downloaded sanitized iStat Menus settings from main branch"
        if import_istat_settings "$TEMP_SANITIZED" "false"; then
            rm "$TEMP_SANITIZED"
        else
            rm "$TEMP_SANITIZED"
            exit 1
        fi
    else
        echo "Could not download iStat Menus settings from repository"
        echo "iStat Menus will use default settings"
        echo ""
        echo "To configure iStat Menus with your custom settings:"
        echo "1. Generate a personalized bootstrap using GitHub Actions"
        echo "2. Or export your settings from iStat Menus (File > Export Settings)"
        echo "3. Save as 'istat-menus-settings.ismp' in the preferences directory"
        echo "4. Re-run the bootstrap process"
    fi
fi

echo "iStat Menus configuration complete!"
