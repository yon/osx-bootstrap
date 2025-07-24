#!/usr/bin/env bash

echo "Configuring Spaces and Mission Control..."

# Mission Control settings
echo "Setting up Mission Control preferences..."

# Enable Mission Control (0 = enabled, 1 = disabled)
defaults write com.apple.dock mcx-expose-disabled -bool false

# Enable Spaces (1 = enabled, 0 = disabled)
defaults write com.apple.dock workspaces -bool true

# Disable automatically rearrange Spaces based on most recent use (0 = disabled, 1 = enabled)
# Your current setting: false
defaults write com.apple.dock mru-spaces -bool false

# Enable switch to Space with app activation (1 = enabled, 0 = disabled)
# Your current setting: true
defaults write com.apple.dock workspaces-auto-swoosh -bool true

# Displays have separate Spaces (0 = false, 1 = true)
# Your current setting: false (displays do NOT have separate Spaces)
defaults write com.apple.dock spans-displays -bool false

# Group windows by application in Mission Control (0 = disabled, 1 = enabled)
# Your current setting: false
defaults write com.apple.dock expose-group-apps -bool false

# Hot Corners configuration
echo "Configuring Hot Corners..."

# Hot corner actions:
# 1: No Action
# 2: Mission Control
# 3: Application Windows
# 4: Desktop
# 5: Start Screen Saver
# 6: Disable Screen Saver
# 7: Dashboard
# 10: Put Display to Sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

# Top left screen corner → No Action
defaults write com.apple.dock wvous-tl-corner -int 1
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → No Action
defaults write com.apple.dock wvous-tr-corner -int 1
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → No Action
defaults write com.apple.dock wvous-bl-corner -int 1
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Unknown action (14) - keeping as is
# Note: Action 14 might be a custom or newer action not in our list
defaults write com.apple.dock wvous-br-corner -int 14
defaults write com.apple.dock wvous-br-modifier -int 0

# Additional Mission Control settings
echo "Configuring additional Mission Control settings..."

# Speed up Mission Control animations (optional)
# defaults write com.apple.dock expose-animation-duration -float 0.1

echo "Spaces and Mission Control configuration complete!"
echo
echo "Note: Some settings require a restart of Dock/Mission Control to take effect:"
echo "- Dock will be restarted automatically"
echo "- You may need to log out and back in for all Spaces settings to apply"
echo "- Keyboard shortcuts are managed separately in System Preferences"

# Restart Dock to apply changes
echo "Restarting Dock to apply changes..."
killall Dock

echo "Spaces and Mission Control settings applied successfully!"
echo
echo "Manual setup required:"
echo "1. Press F3 or swipe up with 3 fingers to open Mission Control"
echo "2. Create 5 desktop Spaces by clicking the '+' button at the top-right"
echo "3. Arrange your applications across the 5 Spaces as desired"
echo
echo "Keyboard shortcuts (should work automatically):"
echo "• Control+1-5: Switch to specific Spaces"
echo "• Control+Left/Right: Switch between adjacent Spaces"
echo "• F3: Open Mission Control"
