#!/usr/bin/env bash

echo "Configuring keyboard settings..."

# Function key behavior - Use F1, F2, etc. as standard function keys
# This means F1-F12 act as function keys by default, requiring Fn for brightness/volume
# Your current setting: enabled (1)
defaults write -g com.apple.keyboard.fnState -bool true
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
# Also try the Apple HIToolbox domain which handles some keyboard settings
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

echo "✓ Function keys set to standard mode (F1-F12 direct access)"

# Key repeat settings - Very fast repeat with short delay
# Your current settings: KeyRepeat=1 (very fast), InitialKeyRepeat=15 (short delay)
defaults write -g KeyRepeat -int 1
defaults write -g InitialKeyRepeat -int 15

echo "✓ Key repeat set to very fast with short initial delay"

# Text input behavior - Minimal auto-corrections based on your preferences
defaults write -g NSAutomaticSpellingCorrectionEnabled -bool false
defaults write -g NSAutomaticCapitalizationEnabled -bool false
defaults write -g NSAutomaticPeriodSubstitutionEnabled -bool true  # You have this enabled
defaults write -g NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write -g NSAutomaticDashSubstitutionEnabled -bool false

echo "✓ Text input settings configured (minimal auto-corrections)"

# Disable text replacement for common programming patterns
defaults write -g WebAutomaticTextReplacementEnabled -bool false

# Caps Lock behavior - Keep as default (you haven't modified it)
# No changes needed since you use default behavior

# Accessibility settings - Keep disabled (your current settings)
defaults write com.apple.universalaccess slowKey -bool false
defaults write com.apple.universalaccess stickyKey -bool false

echo "✓ Accessibility settings configured"

# Additional useful keyboard settings
# Disable press-and-hold for accent characters (useful for programmers)
defaults write -g ApplePressAndHoldEnabled -bool false

echo "✓ Press-and-hold disabled (enables key repeat for all keys)"

# Set input source to US English (your current layout)
# Note: Input source changes are complex and best done through System Preferences

echo
echo "Keyboard configuration complete!"
echo
echo "Settings applied:"
echo "• Function keys set to standard F1-F12 mode (brightness = direct F1/F2)"
echo "• Very fast key repeat with short delay"
echo "• Minimal text auto-corrections"
echo "• Press-and-hold disabled (enables key repeat)"
echo
echo "⚠️  IMPORTANT: Function key changes require a RESTART to take effect"
echo "   After restart: F1/F2 = brightness, F10/F11/F12 = volume (no Fn needed)"
echo "   For traditional F1/F2 function keys, use Fn+F1/F2"
