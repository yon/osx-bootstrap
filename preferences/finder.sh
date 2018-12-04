#!/usr/bin/env bash

defaults write NSGlobalDomain AppleShowAllExtensions -bool true
defaults write NSGlobalDomain com.apple.springing.delay -float 0.667
defaults write NSGlobalDomain com.apple.springing.enabled -bool false

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder AppleShowAllFiles -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FinderSpawnTab -bool false
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'
defaults write com.apple.finder NewWindowTarget -string 'PfHm'
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"
defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
defaults write com.apple.finder QLEnableTextSelection -bool true
defaults write com.apple.finder QuitMenuItem -bool true
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowPathbar -bool true
defaults write com.apple.finder ShowRecentTags -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder WarnOnEmptyTrash -bool false

defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
defaults write com.apple.frameworks.diskimages skip-verify -bool true
defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true

defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true

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

/usr/libexec/PlistBuddy \
  -c "Set :DesktopViewSettings:IconViewSettings:labelOnBottom false" \
  ~/Library/Preferences/com.apple.finder.plist 2>/dev/null

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

  declare -a column_ascending=(1 0 0 0 1 1 1 1 0)
  declare -a column_identifier=(name dateModified dateCreated size kind label version comments dateLastOpened)
  declare -a column_visible=(1 1 0 1 0 0 0 0 0)
  declare -a column_width=(300 150 181 75 115 100 75 300 200)

  # for lvs in \
  #   'ExtendedListViewSettingsV2' \
  # ; do
  #   for i in ${!column_ascending[@]} \
  #   ; do
  #     /usr/libexec/PlistBuddy \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:ascending ${column_ascending[${i}]}" \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:index ${i}" \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:visible ${column_visible[${i}]}" \
  #       -c "Set :${vs}:${lvs}:columns:${column_identifier[${i}]}:width ${column_width[${i}]}" \
  #       ~/Library/Preferences/com.apple.finder.plist 2>/dev/null
  #   done
  # done

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

chflags nohidden ~/Library
# sudo chflags nohidden /Volumes

pushd ~ 1>2 && /usr/bin/find . -name .DS_Store -delete 2>/dev/null; popd 1>2

for process in \
  'cfprefsd' \
  'Finder' \
; do
  killall "${process}" &>/dev/null
done
