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

SETTINGS_FILE="$(dirname "$0")/istat-menus-settings.ismp"

if [ -f "$SETTINGS_FILE" ]; then
    # Local settings file found
    import_istat_settings "$SETTINGS_FILE" "false"
else
    # No local file found, try remote download
    echo "Local iStat Menus settings not found, trying remote..."
    
    TEMP_SETTINGS="/tmp/istat-menus-settings.ismp"
    
    if curl -fsSL "https://raw.githubusercontent.com/yon/osx-bootstrap/main/preferences/istat-menus-settings.ismp" -o "$TEMP_SETTINGS"; then
        echo "Downloaded iStat Menus settings from main branch"
        if import_istat_settings "$TEMP_SETTINGS" "false"; then
            rm "$TEMP_SETTINGS"
        else
            rm "$TEMP_SETTINGS"
            exit 1
        fi
    else
        echo "Could not download iStat Menus settings from repository"
        echo "iStat Menus will use default settings"
        echo ""
        echo "To configure iStat Menus with your custom settings:"
        echo "1. Export your settings from iStat Menus (File > Export Settings)"
        echo "2. Save as 'istat-menus-settings.ismp' in the preferences directory"
        echo "3. Re-run the bootstrap process"
        echo "4. Or add your license manually via the iStat Menus preferences UI"
    fi
fi

echo "iStat Menus configuration complete!"
