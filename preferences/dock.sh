#!/usr/bin/env bash

echo "Configuring Dock preferences..."

# Remove all existing dock items
defaults write com.apple.dock persistent-apps -array

# Add applications to dock
dock_add_app() {
    local app_name="$1"
    local app_path=""
    
    # Check common locations for apps
    if [ -d "/Applications/${app_name}.app" ]; then
        app_path="/Applications/${app_name}.app"
    elif [ -d "/System/Applications/${app_name}.app" ]; then
        app_path="/System/Applications/${app_name}.app"
    elif [ -d "/Applications/Utilities/${app_name}.app" ]; then
        app_path="/Applications/Utilities/${app_name}.app"
    elif [ -d "/System/Applications/Utilities/${app_name}.app" ]; then
        app_path="/System/Applications/Utilities/${app_name}.app"
    fi
    
    if [ -n "$app_path" ]; then
        defaults write com.apple.dock persistent-apps -array-add "<dict><key>tile-data</key><dict><key>file-data</key><dict><key>_CFURLString</key><string>$app_path</string><key>_CFURLStringType</key><integer>0</integer></dict></dict></dict>"
        echo "Added $app_name to dock"
    else
        echo "Warning: $app_name not found"
    fi
}

# Your current dock applications (in exact order from dock-capture.sh)
dock_add_app "Terminal"
dock_add_app "Safari"
dock_add_app "Google Chrome"
dock_add_app "Messages"
dock_add_app "WhatsApp"
dock_add_app "Slack"
dock_add_app "FaceTime"
dock_add_app "Contacts"
dock_add_app "Photos"
dock_add_app "Notes"
dock_add_app "Home Assistant"
dock_add_app "Home"
dock_add_app "Cursor"
dock_add_app "Visual Studio Code"
dock_add_app "System Settings"

# Add folders/stacks to the right side of the dock
dock_add_folder() {
    local folder_path="$1"
    local display_as="$2"  # 0=folder, 1=stack
    local show_as="$3"     # 0=automatic, 1=fan, 2=grid, 3=list
    local sort_by="$4"     # 1=name, 2=date added, 3=date modified, 4=date created, 5=kind
    
    if [ -d "$folder_path" ]; then
        defaults write com.apple.dock persistent-others -array-add "<dict>
            <key>tile-data</key>
            <dict>
                <key>arrangement</key>
                <integer>$sort_by</integer>
                <key>displayas</key>
                <integer>$display_as</integer>
                <key>file-data</key>
                <dict>
                    <key>_CFURLString</key>
                    <string>file://$folder_path</string>
                    <key>_CFURLStringType</key>
                    <integer>15</integer>
                </dict>
                <key>showas</key>
                <integer>$show_as</integer>
            </dict>
            <key>tile-type</key>
            <string>directory-tile</string>
        </dict>"
        echo "Added folder: $folder_path"
    else
        echo "Warning: Folder not found: $folder_path"
    fi
}

# Clear existing dock folders/stacks
defaults write com.apple.dock persistent-others -array

# Add your dock folders (right side) - based on current settings
dock_add_folder "/Applications" 0 0 1                    # Applications as folder, automatic view, sort by name  
dock_add_folder "$HOME/Downloads" 0 0 1                  # Downloads as folder (no arrangement/showas in plist, defaults)

# Note: Trash is special and added automatically by macOS

# Dock appearance settings (matching your current preferences)
defaults write com.apple.dock tilesize -int 64
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock largesize -int 72
defaults write com.apple.dock orientation -string "bottom"
defaults write com.apple.dock mineffect -string "genie"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock launchanim -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock autohide-time-modifier -float 0.5

# Additional dock behaviors (from system.sh)
defaults write com.apple.dock checked-for-launchpad -bool true                     # Skip Launchpad setup
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true   # Enable spring loading for all Dock items
defaults write com.apple.dock expose-animation-duration -float 0.1                 # Speed up Mission Control animations
defaults write com.apple.dock mouse-over-hilite-stack -bool true                   # Enable highlight hover effect for stacks
defaults write com.apple.dock showhidden -bool true                                # Make Dock icons of hidden applications translucent
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0                   # Disable Launchpad gesture
defaults write com.apple.dock single-app -bool true                                # Enable single app mode (hide other apps when switching)
defaults write com.apple.dock size-immutable -bool true                            # Make dock size immutable

# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen

# Top left screen corner → Mission Control
defaults write com.apple.dock wvous-tl-corner -int 2
defaults write com.apple.dock wvous-tl-modifier -int 0

# Top right screen corner → Desktop
defaults write com.apple.dock wvous-tr-corner -int 4
defaults write com.apple.dock wvous-tr-modifier -int 0

# Bottom left screen corner → Start screen saver
defaults write com.apple.dock wvous-bl-corner -int 5
defaults write com.apple.dock wvous-bl-modifier -int 0

# Bottom right screen corner → Notification Center
defaults write com.apple.dock wvous-br-corner -int 12
defaults write com.apple.dock wvous-br-modifier -int 0

echo "Dock preferences configured. Restarting Dock..."
killall Dock

echo "Dock configuration complete!"