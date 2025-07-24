#!/usr/bin/env bash

echo "=== Current Keyboard Configuration ==="
echo

# Function key behavior
fn_standard=$(defaults read -g com.apple.keyboard.fnState 2>/dev/null || echo "not set")
echo "Function key behavior:"
if [[ "$fn_standard" == "1" ]]; then
    echo "  Use F1, F2, etc. keys as standard function keys (Fn+key for special features)"
elif [[ "$fn_standard" == "0" ]]; then
    echo "  Use F1, F2, etc. keys for special features (brightness, volume, etc.)"
else
    echo "  Default macOS behavior (likely special features without Fn)"
fi

echo

# Key repeat settings
key_repeat=$(defaults read -g KeyRepeat 2>/dev/null || echo "not set")
initial_key_repeat=$(defaults read -g InitialKeyRepeat 2>/dev/null || echo "not set")

echo "Key repeat settings:"
echo "  Key Repeat: $key_repeat (lower = faster, 2 = fastest, 120 = slowest)"
echo "  Initial Key Repeat: $initial_key_repeat (delay before repeat starts)"

# Convert to human readable
if [[ "$key_repeat" != "not set" ]]; then
    case $key_repeat in
        2) echo "    → Key repeat rate: Fast" ;;
        6) echo "    → Key repeat rate: Normal" ;;
        30) echo "    → Key repeat rate: Slow" ;;
        *) echo "    → Key repeat rate: Custom ($key_repeat)" ;;
    esac
fi

if [[ "$initial_key_repeat" != "not set" ]]; then
    case $initial_key_repeat in
        15) echo "    → Initial delay: Short" ;;
        25) echo "    → Initial delay: Normal" ;;
        68) echo "    → Initial delay: Long" ;;
        *) echo "    → Initial delay: Custom ($initial_key_repeat)" ;;
    esac
fi

echo

# Caps Lock behavior
caps_lock_action=$(defaults read -g com.apple.keyboard.modifiermapping.1452-635-0 2>/dev/null || echo "not set")
echo "Caps Lock key:"
if [[ "$caps_lock_action" == "not set" ]]; then
    echo "  Default behavior (Caps Lock)"
else
    echo "  Modified behavior detected (check System Preferences for details)"
fi

echo

# Text replacement and auto-correction
auto_correct=$(defaults read -g NSAutomaticSpellingCorrectionEnabled 2>/dev/null || echo "not set")
auto_capitalize=$(defaults read -g NSAutomaticCapitalizationEnabled 2>/dev/null || echo "not set")
auto_period=$(defaults read -g NSAutomaticPeriodSubstitutionEnabled 2>/dev/null || echo "not set")
smart_quotes=$(defaults read -g NSAutomaticQuoteSubstitutionEnabled 2>/dev/null || echo "not set")
smart_dashes=$(defaults read -g NSAutomaticDashSubstitutionEnabled 2>/dev/null || echo "not set")

echo "Text input settings:"
echo "  Auto-correct spelling: $([[ $auto_correct == "1" ]] && echo "enabled" || echo "disabled")"
echo "  Capitalize words automatically: $([[ $auto_capitalize == "1" ]] && echo "enabled" || echo "disabled")"
echo "  Add period with double-space: $([[ $auto_period == "1" ]] && echo "enabled" || echo "disabled")"
echo "  Use smart quotes: $([[ $smart_quotes == "1" ]] && echo "enabled" || echo "disabled")"
echo "  Use smart dashes: $([[ $smart_dashes == "1" ]] && echo "enabled" || echo "disabled")"

echo

# Input sources (keyboard layouts)
echo "Input sources:"
input_sources=$(defaults read com.apple.HIToolbox AppleEnabledInputSources 2>/dev/null || echo "not available")
if [[ "$input_sources" != "not available" ]]; then
    echo "$input_sources" | grep -E "(InputSourceKind|KeyboardLayout Name)" | sed 's/^[[:space:]]*/  /'
else
    echo "  Could not retrieve input source information"
fi

echo

# Additional keyboard shortcuts info
echo "Keyboard shortcuts:"
echo "  Stored in: ~/Library/Preferences/com.apple.symbolichotkeys.plist"
echo "  Note: These are complex to parse and should be configured manually"
echo "  Common shortcuts include:"
echo "    - Spotlight: Cmd+Space"
echo "    - Switch input source: Control+Space (if multiple layouts)"
echo "    - Mission Control shortcuts (see spaces configuration)"

echo
echo "Accessibility settings:"
slow_keys=$(defaults read com.apple.universalaccess slowKey 2>/dev/null || echo "0")
sticky_keys=$(defaults read com.apple.universalaccess stickyKey 2>/dev/null || echo "0")
echo "  Slow Keys: $([[ $slow_keys == "1" ]] && echo "enabled" || echo "disabled")"
echo "  Sticky Keys: $([[ $sticky_keys == "1" ]] && echo "enabled" || echo "disabled")"
