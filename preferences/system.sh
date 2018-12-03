#!/usr/bin/env bash

osascript -e 'tell application "System Preferences" to quit'

sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

defaults write NSGlobalDomain AppleICUForce24HourTime -bool true
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2
defaults write NSGlobalDomain AppleLanguages -array 'en-US' 'es-US'
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
defaults write NSGlobalDomain AppleShowScrollBars -string Always
defaults write NSGlobalDomain AppleWindowTabbingMode -string always
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5
defaults write NSGlobalDomain InitialKeyRepeat -int 15
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array '{on=1;replace="(shrug)";with="\\U00af\\\\_(\\U30c4)_/\\U00af";}' '{on=1;replace=aapl;with="\\Uf8ff";}' '{on=1;replace=bb;with=bb;}' '{on=1;replace=jy;with="\\U56db";}' '{on=1;replace=omw;with="On my way";}' '{on=1;replace=shrug;with="\\U00af\\\\_(\\U30c4)_/\\U00af";}' '{on=1;replace=yf;with=yonatanfeldman;}'
defaults write NSGlobalDomain NSUserKeyEquivalents '{"Hide Others"="@~h";}'
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0

defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true
defaults -currentHost write com.apple.screensaver idleTime -int 600
defaults -currentHost write com.apple.screensaver showClock -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true
defaults write AppleEnableSwipeNavigateWithScrolls -bool false
defaults write CGDisableCursorLocationMagnification -bool false
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
defaults write com.apple.ActivityMonitor ShowCategory -int 0
defaults write com.apple.ActivityMonitor SortColumn -string 'CPUUsage'
defaults write com.apple.ActivityMonitor SortDirection -int 0
defaults write com.apple.addressbook ABShowDebugMenu -bool true
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0
defaults write com.apple.appstore ShowDebugMenu -bool true
defaults write com.apple.appstore WebKitDeveloperExtras -bool true
defaults write com.apple.assistant.support 'Dictation Enabled' -bool true
defaults write com.apple.BezelServices dAuto -bool false
defaults write com.apple.BezelServices kDim -bool true
defaults write com.apple.BezelServices kDimTime -int 300
defaults write com.apple.commerce AutoUpdate -bool true
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true
defaults write com.apple.controlstrip MiniCustomized -array com.apple.system.brightness com.apple.system.mute com.apple.system.volume com.apple.system.screen-lock
defaults write com.apple.CrashReporter UseUNC 1
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock checked-for-launchpad -bool true
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock largesize -int 72
defaults write com.apple.dock launchanim -bool false
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock mouse-over-hilite-stack -bool true
defaults write com.apple.dock show-process-indicators -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock showhidden -bool true
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0
defaults write com.apple.dock single-app -bool true
defaults write com.apple.dock size-immutable -bool true
defaults write com.apple.dock tilesize -int 64
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 0
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0
defaults write com.apple.helpviewer DevMode -bool true
defaults write com.apple.ImageCapture disableHotPlug -bool true
defaults write com.apple.iTunes disablePing -bool true
defaults write com.apple.iTunes disablePingSidebar -bool true
defaults write com.apple.LaunchServices LSQuarantine -bool false
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false
defaults write com.apple.loginwindow TALLogoutSavesState -bool false
defaults write com.apple.menuextra.clock DateFormat -string 'HH:mm'
defaults write com.apple.notificationcenterui bannerTime -float 2.5
defaults write com.apple.preferences.extensions.ShareMenu displayOrder -array 'com.apple.share.System.add-to-safari-reading-list' 'com.apple.share.Messages.compose' 'com.apple.share.AirDrop.send' 'com.apple.share.Mail.compose' 'com.apple.share.Facebook.post' 'com.apple.share.Twitter.post'
defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true
defaults write com.apple.screencapture disable-shadow -bool true
defaults write com.apple.screencapture type -string png
defaults write com.apple.Siri StatusMenuVisible -bool false
defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true
defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1
defaults write com.apple.SoftwareUpdate ConfigDataInstall -int 1
defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMIntroMessagePresented -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMMasterDictationEnabled -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMPresentedOfflineUpgradeSuggestion -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMSIFolderWasUpdated -bool true
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMUseOnlyOfflineDictation -bool true
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4
defaults write com.apple.TextEdit RichText -bool false
defaults write com.apple.touchbar.agent PresentationModeGlobal -string functionKeys
sudo defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
sudo defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
sudo defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144

for domain in ~/Library/Preferences/ByHost/com.apple.systemuiserver.* \
; do
  sudo defaults write "${domain}" dontAutoLoad -array \
    '/System/Library/CoreServices/Menu Extras/Battery.menu' \
    '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' \
  	'/System/Library/CoreServices/Menu Extras/Clock.menu' \
		'/System/Library/CoreServices/Menu Extras/TimeMachine.menu' \
    '/System/Library/CoreServices/Menu Extras/User.menu' \
		'/System/Library/CoreServices/Menu Extras/Volume.menu'
done

for domain in \
  ~/Library/Preferences/com.apple.systemuiserver.plist \
  com.apple.systemuiserver \
; do
  defaults write ${domain} 'NSStatusItem Visible Siri' -bool false
  defaults write ${domain} 'NSStatusItem Visible com.apple.menuextra.airplay' -bool false
  defaults write ${domain} 'NSStatusItem Visible com.apple.menuextra.airport' -bool true
  defaults write ${domain} 'NSStatusItem Visible com.apple.menuextra.battery' -bool false
  defaults write ${domain} 'NSStatusItem Visible com.apple.menuextra.clock' -bool false
  defaults write ${domain} 'NSStatusItem Visible com.apple.menuextra.dwellcontrol' -bool false
  defaults write ${domain} 'NSStatusItem Visible com.apple.menuextra.textinput' -bool false
  defaults write ${domain} menuExtras -array '/System/Library/CoreServices/Menu Extras/AirPort.menu'
done

# for process in \
#   'cfprefsd' \
#   'Dock' \
#   'SystemUIServer' \
# ; do
#   killall "${process}" &> /dev/null
# done
