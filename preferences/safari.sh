#!/usr/bin/env bash

# https://github.com/joeyhoer/starter/blob/master/apps/safari.sh
# https://apple.stackexchange.com/questions/309702/set-default-finder-view-and-arrange-by-options

# You must add Terminal to "System Preferences -> Security & Privacy -> Privacy -> Full Disk Access"
#   still need to figure out how to do this programatically

defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari 'NSWindow Frame BrowserWindowFrame' '0 0 1024 877 0 0 1440 877'
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AlwaysShowTabBar -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari BlockStoragePolicy -int 2
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultTextEncodingName -string 'utf-8'
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ShouldPrintBackgrounds -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 1
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari DownloadsClearingPolicy -int 2
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari HomePage -string 'https://mail.milliped.com'
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari IncludeDevelopMenu -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NewTabBehavior -int 1
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NewWindowBehavior -int 0
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari PrintHeadersAndFooters -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ProxiesInBookmarksBar '()'
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFavoritesBar -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowSidebarInTopSites -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowStatusBar -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SuppressSearchSuggestions -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari TabCreationPolicy -int 2
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari UniversalSearchEnabled -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitDefaultTextEncodingName -string 'utf-8'
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitInitialTimedLayoutDelay 0.25
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitShouldPrintBackgroundsPreferenceKey -bool false
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitStorageBlockingPolicy -int 1
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebsiteSpecificSearchEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
