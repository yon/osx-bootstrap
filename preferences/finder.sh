#!/usr/bin/env bash

# Global file extension and spring-loading settings
defaults write NSGlobalDomain AppleShowAllExtensions -bool true                    # Always show file extensions
defaults write NSGlobalDomain com.apple.springing.delay -float 0.667               # Set spring-loading delay for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool false              # Disable spring-loading for directories and Desktop

# Desktop Services (.DS_Store) settings
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true       # Avoid creating .DS_Store files on network volumes
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true           # Avoid creating .DS_Store files on USB volumes

# Finder window and display settings
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true                 # Show full POSIX path as Finder window title
defaults write com.apple.finder _FXSortFoldersFirst -bool true                     # Keep folders on top when sorting by name
defaults write com.apple.finder AppleShowAllFiles -bool false                      # Don't show hidden files (set to true to show hidden files)
defaults write com.apple.finder DisableAllAnimations -bool true                    # Disable Finder animations for better performance
defaults write com.apple.finder FinderSpawnTab -bool false                         # Don't open new windows in tabs

# Finder search and file handling
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'                # Search current folder by default
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false         # Disable warning when changing file extensions
defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true  # Expand General and Open With panes in Get Info
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'                # Set default view style to list view
defaults write com.apple.finder NewWindowTarget -string 'PfHm'                     # Set new Finder windows to open to home folder
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"       # Set path for new Finder windows

# Finder desktop and interface settings
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true           # Open new Finder window when removable disk is inserted
defaults write com.apple.finder QLEnableTextSelection -bool true                   # Enable text selection in Quick Look
defaults write com.apple.finder QuitMenuItem -bool true                            # Enable "Quit Finder" menu item
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true         # Show external hard drives on desktop
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true                 # Show hard drives on desktop
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true             # Show mounted servers on desktop
defaults write com.apple.finder ShowPathbar -bool true                             # Show path bar in Finder windows
defaults write com.apple.finder ShowRecentTags -bool false                         # Hide recent tags in Finder sidebar
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true             # Show removable media on desktop
defaults write com.apple.finder ShowStatusBar -bool true                           # Show status bar in Finder windows
defaults write com.apple.finder WarnOnEmptyTrash -bool false                       # Don't warn when emptying trash

# Disk image settings
defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true        # Automatically open read-only disk images
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true        # Automatically open read-write disk images
defaults write com.apple.frameworks.diskimages skip-verify -bool true              # Skip disk image verification
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true       # Skip verification of locked disk images
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true       # Skip verification of remote disk images

# Network browser settings
defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true             # Use AirDrop over every interface

# Configure icon view settings for different view contexts
echo "Configuring Finder icon view settings..."
for vs in 'DesktopViewSettings' \
  'FK_StandardViewSettings' \
  'StandardViewSettings'; do
    /usr/libexec/PlistBuddy \
      -c "Set :${vs}:IconViewSettings:arrangeBy name" \
      -c "Set :${vs}:IconViewSettings:gridSpacing 64" \
      -c "Set :${vs}:IconViewSettings:iconSize 48" \
      -c "Set :${vs}:IconViewSettings:labelOnBottom true" \
      -c "Set :${vs}:IconViewSettings:showIconPreview true" \
      -c "Set :${vs}:IconViewSettings:showItemInfo true" \
      -c "Set :${vs}:IconViewSettings:textSize 12" \
      ~/Library/Preferences/com.apple.finder.plist 2>/dev/null
done

# Desktop-specific setting: show labels on the side instead of bottom
/usr/libexec/PlistBuddy \
  -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom false" \
  ~/Library/Preferences/com.apple.finder.plist 2>/dev/null

# Configure list view settings for standard view contexts
echo "Configuring Finder list view settings..."
for vs in \
  'FK_StandardViewSettings' \
  'StandardViewSettings' \
; do

  for lvs in \
    'ExtendedListViewSettingsV2' \
    'ListViewSettings' \
  ; do
    /usr/libexec/PlistBuddy \
      -c "Set :${vs}:${lvs}:calculateAllSizes 1" \
      -c "Set :${vs}:${lvs}:sortColumn name" \
      -c "Set :${vs}:${lvs}:textSize 12" \
      -c "Set :${vs}:${lvs}:useRelativeDates 0" \
      -c "Set :${vs}:${lvs}:viewOptionsVersion 1" \
      ~/Library/Preferences/com.apple.finder.plist 2>/dev/null
  done

  # Define column settings for list view
  declare -a column_ascending=(1 0 0 0 1 1 1 1 0)                                  # Sort order for each column
  declare -a column_identifier=(name dateModified dateCreated size kind label version comments dateLastOpened)
  declare -a column_visible=(1 1 0 1 0 0 0 0 0)                                    # Which columns to show (1=visible, 0=hidden)
  declare -a column_width=(300 150 181 75 115 100 75 300 200)                      # Width of each column

  # Note: ExtendedListViewSettingsV2 configuration is commented out as it may not work reliably
  # Uncomment the following section if you need to configure extended list view settings:
  # for lvs in 'ExtendedListViewSettingsV2'; do
  #   for i in ${!column_ascending[@]}; do
  #     /usr/libexec/PlistBuddy \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:ascending ${column_ascending[${i}]}" \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:index ${i}" \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:visible ${column_visible[${i}]}" \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:width ${column_width[${i}]}" \
  #       ~/Library/Preferences/com.apple.finder.plist 2>/dev/null
  #   done
  # done

  # Configure standard list view column settings
  for lvs in \
    'ListViewSettings' \
  ; do
    for i in ${!column_ascending[@]} \
    ; do
      /usr/libexec/PlistBuddy \
        -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:ascending ${column_ascending[${i}]}" \
        -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:index ${i}" \
        -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:visible ${column_visible[${i}]}" \
        -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:width ${column_width[${i}]}" \
        ~/Library/Preferences/com.apple.finder.plist 2>/dev/null
    done
  done

done

# Show the ~/Library folder (hidden by default)
chflags nohidden ~/Library

# Uncomment to show /Volumes folder if needed:
# sudo chflags nohidden /Volumes

# Clean up existing .DS_Store files in home directory (limited scope for performance)
# Note: Only cleaning common directories to avoid hanging on large file systems
echo "Cleaning up .DS_Store files..."
for dir in ~/Desktop ~/Documents ~/Downloads; do
  if [ -d "$dir" ]; then
    echo "  Cleaning $dir..."
    /usr/bin/find "$dir" -name .DS_Store -delete 2>/dev/null
  fi
done
echo "Cleanup completed."

# Restart affected processes to apply changes
for process in \
  'cfprefsd' \
  'Finder' \
; do
  killall "${process}" &>/dev/null
done
