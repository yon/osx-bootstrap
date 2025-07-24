#!/usr/bin/env bash

echo "=== Current Spaces Configuration ==="
echo

# Mission Control preferences
mission_control_enabled=$(defaults read com.apple.dock mcx-expose-disabled 2>/dev/null || echo "0")
spaces_enabled=$(defaults read com.apple.dock workspaces 2>/dev/null || echo "1")
automatic_rearrange=$(defaults read com.apple.dock mru-spaces 2>/dev/null || echo "1")
switch_on_activate=$(defaults read com.apple.dock workspaces-auto-swoosh 2>/dev/null || echo "1")
displays_separate_spaces=$(defaults read com.apple.dock spans-displays 2>/dev/null || echo "0")
group_windows_by_app=$(defaults read com.apple.dock expose-group-apps 2>/dev/null || echo "0")

echo "Mission Control enabled: $([[ $mission_control_enabled == "0" ]] && echo "true" || echo "false")"
echo "Spaces enabled: $([[ $spaces_enabled == "1" ]] && echo "true" || echo "false")"
echo "Automatically rearrange Spaces: $([[ $automatic_rearrange == "1" ]] && echo "true" || echo "false")"
echo "Switch to Space with app activation: $([[ $switch_on_activate == "1" ]] && echo "true" || echo "false")"
echo "Displays have separate Spaces: $([[ $displays_separate_spaces == "0" ]] && echo "false" || echo "true")"
echo "Group windows by application: $([[ $group_windows_by_app == "1" ]] && echo "true" || echo "false")"

echo

# Hot corners
tl_corner=$(defaults read com.apple.dock wvous-tl-corner 2>/dev/null || echo "1")
tr_corner=$(defaults read com.apple.dock wvous-tr-corner 2>/dev/null || echo "1")
bl_corner=$(defaults read com.apple.dock wvous-bl-corner 2>/dev/null || echo "1")
br_corner=$(defaults read com.apple.dock wvous-br-corner 2>/dev/null || echo "1")

decode_corner() {
    case $1 in
        1) echo "No Action" ;;
        2) echo "Mission Control" ;;
        3) echo "Application Windows" ;;
        4) echo "Desktop" ;;
        5) echo "Start Screen Saver" ;;
        10) echo "Put Display to Sleep" ;;
        11) echo "Launchpad" ;;
        12) echo "Notification Center" ;;
        13) echo "Lock Screen" ;;
        *) echo "Unknown ($1)" ;;
    esac
}

echo "Hot corners:"
echo "  Top Left: $(decode_corner $tl_corner)"
echo "  Top Right: $(decode_corner $tr_corner)"
echo "  Bottom Left: $(decode_corner $bl_corner)"
echo "  Bottom Right: $(decode_corner $br_corner)"

echo

# Spaces count
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
if spaces_count=$("$SCRIPT_DIR/spaces-count.sh" 2>/dev/null); then
    echo "Current Spaces: $spaces_count"
else
    echo "Current Spaces: Could not detect (Spaces may not be enabled)"
fi

echo
echo "Keyboard shortcuts:"
echo "  Mission Control: F3"
echo "  Switch between Spaces: Control+Left/Right"
echo "  Switch to specific Space: Control+1-5"
