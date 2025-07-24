#!/usr/bin/env bash

# Detect the number of configured desktop Spaces on macOS

set -euo pipefail

get_spaces_count() {
    local plist_path="$HOME/Library/Preferences/com.apple.spaces.plist"

    # Try JSON parsing first (most reliable)
    if [[ -f "$plist_path" ]]; then
        local json_output
        if json_output=$(plutil -convert json -o - "$plist_path" 2>/dev/null); then
            local count
            count=$(python3 -c "
import json, sys
try:
    data = json.loads('''$json_output''')
    monitors = data.get('SpacesDisplayConfiguration', {}).get('Management Data', {}).get('Monitors', [])
    for monitor in monitors:
        if monitor.get('Display Identifier') == 'Main' and 'Spaces' in monitor:
            print(len(monitor['Spaces']))
            sys.exit(0)
    sys.exit(1)
except: sys.exit(1)
" 2>/dev/null)

            if [[ -n "$count" && "$count" =~ ^[0-9]+$ ]]; then
                echo "$count"
                return 0
            fi
        fi
    fi

    # Fallback to defaults parsing
    local defaults_output
    if defaults_output=$(defaults read com.apple.spaces 2>/dev/null); then
        local main_section
        main_section=$(echo "$defaults_output" | sed -n '/"Display Identifier" = Main;/,/}/p')
        if [[ -n "$main_section" ]]; then
            local count
            count=$(echo "$main_section" | grep -c "ManagedSpaceID = " || echo "0")
            if [[ "$count" =~ ^[0-9]+$ ]] && [[ "$count" -gt 0 ]]; then
                echo "$count"
                return 0
            fi
        fi
    fi

    return 1
}

main() {
    local space_count
    if space_count=$(get_spaces_count); then
        if [[ "${1:-}" == "--verbose" || "${1:-}" == "-v" ]]; then
            echo "Detected $space_count desktop Spaces"
        else
            echo "$space_count"
        fi
    else
        echo "Error: Could not detect Spaces count" >&2
        echo "Ensure Spaces are enabled in Mission Control" >&2
        return 1
    fi
}

main "$@"
