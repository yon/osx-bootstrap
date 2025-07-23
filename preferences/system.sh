#!/usr/bin/env bash

# Quit System Preferences/Settings to prevent conflicts
osascript -e 'tell application "System Preferences" to quit' 2>/dev/null || true
osascript -e 'tell application "System Settings" to quit' 2>/dev/null || true

# Ask for administrator password upfront and keep sudo session alive
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Hostname configuration (commented out - uncomment and customize as needed)

# read -p 'Enter your desired hostname: ' hostname
# sudo scutil --set ComputerName "${hostname}"                                     # Set computer name as it appears in Finder sidebar
# sudo scutil --set HostName "${hostname}"                                         # Set hostname for network identification
# sudo scutil --set LocalHostName "${hostname}"                                    # Set local hostname for Bonjour
# sudo systemsetup -setcomputername "${hostname}"                                  # Set computer name in System Settings
# sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "${hostname}"  # Set SMB/CIFS name

# Time & Language
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true                   # Use 24-hour time format
defaults write NSGlobalDomain AppleKeyboardUIMode -int 2                           # Enable full keyboard access for all controls
defaults write NSGlobalDomain AppleLanguages -array 'en-US' 'es-US'                # Set preferred languages
defaults write NSGlobalDomain AppleMiniaturizeOnDoubleClick -bool false            # Disable minimize on double-click
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false                 # Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain AppleShowScrollBars -string Always                   # Always show scroll bars
defaults write NSGlobalDomain AppleWindowTabbingMode -string always                # Always prefer tabs when opening documents
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1                   # Enable tap to click for trackpad
defaults write NSGlobalDomain com.apple.trackpad.forceClick -bool true             # Enable force click and haptic feedback
defaults write NSGlobalDomain com.apple.trackpad.scaling -float 2.5                # Set trackpad tracking speed

# Keyboard repeat settings
defaults write NSGlobalDomain InitialKeyRepeat -int 15                             # Set initial key repeat delay (15 = 225ms)
defaults write NSGlobalDomain KeyRepeat -int 1                                     # Set key repeat rate (1 = 15ms)

# Text input and substitution settings
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false         # Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false       # Disable smart dashes
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool true      # Enable automatic period substitution
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false      # Disable smart quotes

# Window and document behavior
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false       # Disable window animations for speed
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true             # Disable automatic app termination
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false        # Don't save new documents to iCloud by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true        # Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true       # Expand save panel by default (newer apps)
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false                 # Don't restore windows when quitting/reopening apps
defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 2                    # Set sidebar icon size to medium
defaults write NSGlobalDomain NSUserDictionaryReplacementItems -array '{on=1;replace="(shrug)";with="\\U00af\\\\_(\\U30c4)_/\\U00af";}' '{on=1;replace=aapl;with="\\Uf8ff";}' '{on=1;replace=bb;with=bb;}' '{on=1;replace=jy;with="\\U56db";}' '{on=1;replace=omw;with="On my way";}' '{on=1;replace=shrug;with="\\U00af\\\\_(\\U30c4)_/\\U00af";}' '{on=1;replace=yf;with=yonatanfeldman;}'
defaults write NSGlobalDomain NSUserKeyEquivalents '{"Hide Others"="@~h";}'        # Set custom keyboard shortcut for "Hide Others"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001                      # Speed up window resize animations

# Print and Quick Look settings
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true           # Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true          # Expand print panel by default (newer apps)
defaults write NSGlobalDomain QLPanelAnimationDuration -float 0                    # Remove Quick Look animation delay

# Image capture and screensaver settings
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true       # Prevent Photos from opening automatically when devices are plugged in
defaults -currentHost write com.apple.screensaver idleTime -int 600                # Set screensaver to start after 10 minutes
defaults -currentHost write com.apple.screensaver showClock -bool true             # Show clock on screensaver

# Menu bar items (Note: Some of these paths may be outdated in newer macOS versions)
# defaults -currentHost write com.apple.systemuiserver dontAutoLoad -array '/System/Library/CoreServices/Menu Extras/Battery.menu' '/System/Library/CoreServices/Menu Extras/Bluetooth.menu' '/System/Library/CoreServices/Menu Extras/Clock.menu' '/System/Library/CoreServices/Menu Extras/TimeMachine.menu' '/System/Library/CoreServices/Menu Extras/User.menu' '/System/Library/CoreServices/Menu Extras/Volume.menu'

# Handoff and Continuity settings
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityAdvertisingAllowed -bool true  # Enable Handoff advertising
defaults write ~/Library/Preferences/ByHost/com.apple.coreservices.useractivityd ActivityReceivingAllowed -bool true  # Enable Handoff receiving

# Mouse and cursor settings
defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool false      # Disable swipe navigation with scroll wheels
# defaults write CGDisableCursorLocationMagnification -bool false                  # Enable cursor location magnification (may be deprecated)

# Activity Monitor settings
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true                 # Show the main window when launching Activity Monitor
defaults write com.apple.ActivityMonitor ShowCategory -int 0                       # Show all processes (0 = All, 1 = My, 2 = System, 3 = Others, 4 = Active)
defaults write com.apple.ActivityMonitor SortColumn -string 'CPUUsage'             # Sort Activity Monitor results by CPU usage
defaults write com.apple.ActivityMonitor SortDirection -int 0                      # Sort direction (0 = descending, 1 = ascending)

# Contacts app debug menu (Note: May fail on newer macOS versions due to sandboxing)
# defaults write com.apple.addressbook ABShowDebugMenu -bool true                  # Enable debug menu in Contacts app (may not work in modern macOS)

# Trackpad settings
defaults write com.apple.AppleMultitouchTrackpad ActuateDetents -bool true         # Enable trackpad haptic feedback
defaults write com.apple.AppleMultitouchTrackpad ActuationStrength -int 0          # Set trackpad click feedback strength (0 = light, 1 = medium, 2 = firm)
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 0        # Set first click threshold
defaults write com.apple.AppleMultitouchTrackpad ForceSuppressed -bool false       # Enable Force Touch
defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144  # Set zoom modifier key (262144 = Control)
defaults write com.apple.AppleMultitouchTrackpad SecondClickThreshold -int 0       # Set second click threshold

# App Store debug features
defaults write com.apple.appstore ShowDebugMenu -bool true                         # Enable debug menu in App Store
defaults write com.apple.appstore WebKitDeveloperExtras -bool true                 # Enable WebKit developer extras in App Store

# Siri and dictation
defaults write com.apple.assistant.support 'Dictation Enabled' -bool true          # Enable dictation

# Screen brightness controls (Note: BezelServices may be deprecated)
# defaults write com.apple.BezelServices dAuto -bool false                         # Disable automatic brightness adjustment
# defaults write com.apple.BezelServices kDim -bool true                           # Enable screen dimming
# defaults write com.apple.BezelServices kDimTime -int 300                         # Set screen dim time to 5 minutes

# App Store auto-updates
defaults write com.apple.commerce AutoUpdate -bool true                            # Enable automatic app updates
defaults write com.apple.commerce AutoUpdateRestartRequired -bool true             # Enable automatic updates for apps that require restart

# Touch Bar control strip (for MacBooks with Touch Bar)
defaults write com.apple.controlstrip MiniCustomized -array com.apple.system.brightness com.apple.system.mute com.apple.system.volume com.apple.system.screen-lock  # Customize Touch Bar control strip

# Crash reporter settings
defaults write com.apple.CrashReporter UseUNC 1                                    # Use UNC paths for crash reports

# Dock settings
defaults write com.apple.dock autohide-delay -float 0                              # Remove dock auto-hide delay
defaults write com.apple.dock checked-for-launchpad -bool true                     # Skip Launchpad setup
defaults write com.apple.dock enable-spring-load-actions-on-all-items -bool true   # Enable spring loading for all Dock items
defaults write com.apple.dock expose-animation-duration -float 0.1                 # Speed up Mission Control animations
defaults write com.apple.dock largesize -int 72                                    # Set large size for magnified dock items
defaults write com.apple.dock launchanim -bool false                               # Disable opening application animation
defaults write com.apple.dock magnification -bool true                             # Enable dock magnification
defaults write com.apple.dock minimize-to-application -bool true                   # Minimize windows into the application icon
defaults write com.apple.dock mouse-over-hilite-stack -bool true                   # Enable highlight hover effect for stacks
defaults write com.apple.dock show-process-indicators -bool true                   # Show indicator lights for open applications
defaults write com.apple.dock show-recents -bool false                             # Don't show recent applications in dock
defaults write com.apple.dock showhidden -bool true                                # Make Dock icons of hidden applications translucent
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0                   # Disable Launchpad gesture
defaults write com.apple.dock single-app -bool true                                # Enable single app mode (hide other apps when switching)
defaults write com.apple.dock size-immutable -bool true                            # Make dock size immutable
defaults write com.apple.dock tilesize -int 64                                     # Set dock tile size to 64 pixels

# External trackpad settings (for Magic Trackpad)
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true  # Enable tap to click on external trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool false  # Disable dragging on external trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad DragLock -bool false  # Disable drag lock on external trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144  # Set zoom modifier for external trackpad
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadFourFingerHorizSwipeGesture -int 0  # Disable four finger horizontal swipe
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 0  # Disable three finger horizontal swipe

# Help Viewer debug mode
defaults write com.apple.helpviewer DevMode -bool true                             # Enable developer mode in Help Viewer

# Image Capture settings
defaults write com.apple.ImageCapture disableHotPlug -bool true                    # Prevent Image Capture from opening when devices are plugged in

# iTunes/Music app settings (Note: iTunes preferences may not apply to Music app)
# defaults write com.apple.iTunes disablePing -bool true                           # Disable iTunes Ping (deprecated service)
# defaults write com.apple.iTunes disablePingSidebar -bool true                    # Disable iTunes Ping sidebar (deprecated service)

# Security and quarantine settings (SECURITY RISK: Consider carefully before disabling)
# defaults write com.apple.LaunchServices LSQuarantine -bool false                 # Disable quarantine for downloaded applications (NOT RECOMMENDED)

# Login window settings
defaults write com.apple.loginwindow LoginwindowLaunchesRelaunchApps -bool false   # Don't reopen apps after login
defaults write com.apple.loginwindow TALLogoutSavesState -bool false               # Don't save app state on logout

# Menu bar extras
defaults write com.apple.menuextra.battery ShowPercent -bool true                  # Show battery percentage in menu bar
defaults write com.apple.menuextra.clock DateFormat -string 'EEE HH:mm'            # Set menu bar clock format (Day HH:MM)

# Notification Center
defaults write com.apple.notificationcenterui bannerTime -float 2.5                # Set notification banner display time to 2.5 seconds

# Share menu preferences (Note: Some services may be deprecated)
defaults write com.apple.preferences.extensions.ShareMenu displayOrder -array 'com.apple.share.System.add-to-safari-reading-list' 'com.apple.share.Messages.compose' 'com.apple.share.AirDrop.send' 'com.apple.share.Mail.compose' 'com.apple.share.Facebook.post' 'com.apple.share.Twitter.post'  # Set share menu order

# Printing preferences
defaults write com.apple.print.PrintingPrefs 'Quit When Finished' -bool true       # Automatically quit printer app once print jobs complete

# Screenshot settings
defaults write com.apple.screencapture disable-shadow -bool true                   # Disable shadows in screenshots

# defaults write com.apple.screencapture location "~/Desktop"                      # Save screenshots to Desktop (customize path as needed)
defaults write com.apple.screencapture location "~/Library/CloudStorage/GoogleDrive-yon@milliped.com/My Drive/Screenshots"  # Save to Google Drive (customize for your setup)
defaults write com.apple.screencapture type -string png                            # Save screenshots as PNG format

# Siri settings
defaults write com.apple.Siri StatusMenuVisible -bool false                        # Hide Siri from menu bar

# Speech recognition and dictation preferences
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMIntroMessagePresented -bool true  # Mark dictation intro as presented
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMMasterDictationEnabled -bool true  # Enable enhanced dictation
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMPresentedOfflineUpgradeSuggestion -bool true  # Mark offline upgrade suggestion as presented
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMSIFolderWasUpdated -bool true  # Mark dictation folder as updated
defaults write com.apple.speech.recognition.AppleSpeechRecognition.prefs DictationIMUseOnlyOfflineDictation -bool true  # Use only offline dictation

# System Preferences/Settings app
defaults write com.apple.systempreferences NSQuitAlwaysKeepsWindows -bool false    # Don't restore System Preferences windows on reopening

# Menu bar extras (Note: Some paths may be outdated in newer macOS versions)
# defaults write com.apple.systemuiserver menuExtras -array '/System/Library/CoreServices/Menu Extras/AirPort.menu'  # Add Wi-Fi menu to menu bar

# TextEdit preferences
defaults write com.apple.TextEdit PlainTextEncoding -int 4                         # Use UTF-8 encoding for reading plain text
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4                 # Use UTF-8 encoding for writing plain text
defaults write com.apple.TextEdit RichText -bool false                             # Use plain text mode by default

# Touch Bar settings (for MacBooks with Touch Bar)
defaults write com.apple.touchbar.agent PresentationModeGlobal -string functionKeys  # Show function keys in Touch Bar by default

# Accessibility settings
defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true     # Enable scroll wheel to toggle zoom
defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true      # Make zoom follow keyboard focus
defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144     # Set zoom modifier key to Control

# Software Update settings (system-wide)
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticallyInstallMacOSUpdates -bool true  # Automatically install macOS updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticCheckEnabled -bool true  # Automatically check for updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist AutomaticDownload -bool true  # Automatically download updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist ConfigDataInstall -bool true  # Automatically install system data files and security updates
sudo defaults write /Library/Preferences/com.apple.SoftwareUpdate.plist CriticalUpdateInstall -bool true  # Automatically install critical security updates

# Enable locate database (Note: This service may not exist in newer macOS versions)
# sudo launchctl load -w /System/Library/LaunchDaemons/com.apple.locate.plist      # Enable locate database for fast file searching

for process in \
  'cfprefsd' \
  'Dock' \
  'SystemUIServer' \
; do
  killall "${process}" &> /dev/null
done
