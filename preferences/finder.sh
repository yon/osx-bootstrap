#!/usr/bin/env bash

defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true

defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
defaults write com.apple.finder _FXSortFoldersFirst -bool true
defaults write com.apple.finder AppleShowAllFiles -bool false
defaults write com.apple.finder DisableAllAnimations -bool true
defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder FXInfoPanesExpanded -dict General -bool true OpenWith -bool true
defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}/"
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

defaults write NSGlobalDomain AppleShowAllExtensions -bool true

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
      ~/Library/Preferences/com.apple.finder.plist
done

/usr/libexec/PlistBuddy \
  -c 'Set :DesktopViewSettings:GroupBy string none' \
  ~/Library/Preferences/com.apple.finder.plist

for vs in 'FK_StandardViewSettings' \
  'StandardViewSettings'; do

    for lvs in 'ListViewSettings'; do

      /usr/libexec/PlistBuddy \
        -c "Set :${vs}:${lvs}:calculateAllSizes true" \
        -c "Set :${vs}:${lvs}:sortColumn name" \
        -c "Set :${vs}:${lvs}:textSize 11" \
        -c "Set :${vs}:${lvs}:useRelativeDates false" \
        -c "Set :${vs}:${lvs}:viewOptionsVersion 1" \
        ~/Library/Preferences/com.apple.finder.plist

      (( i = 0 ))

      for column in 'name' \
        'dateModified' \
        'size'; do
          (( w = 300 / ( i + 1 ) ))
          /usr/libexec/PlistBuddy \
            -c "Set :${vs}:${lvs}:columns:${column}:ascending true" \
            -c "Set :${vs}:${lvs}:columns:${column}:index ${i}" \
            -c "Set :${vs}:${lvs}:columns:${column}:visible true" \
            -c "Set :${vs}:${lvs}:columns:${column}:width ${w}" \
            ~/Library/Preferences/com.apple.finder.plist
          (( i++ ))
      done

      for column in 'comments' \
        'dateCreated' \
        'dateLastOpened' \
        'kind' \
        'label' \
        'version'; do
          /usr/libexec/PlistBuddy \
            -c "Set :${vs}:${lvs}:columns:${column}:ascending true" \
            -c "Set :${vs}:${lvs}:columns:${column}:index ${i}" \
            -c "Set :${vs}:${lvs}:columns:${column}:visible false" \
            ~/Library/Preferences/com.apple.finder.plist
          (( i++ ))
      done

    done

done

chflags nohidden ~/Library
sudo chflags nohidden /Volumes

for process in \
  'cfprefsd' \
  'Finder' \
; do
  killall "${process}" &> /dev/null
done
