#!/usr/bin/env bash

# https://github.com/joeyhoer/starter/blob/master/apps/safari.sh
# https://apple.stackexchange.com/questions/309702/set-default-finder-view-and-arrange-by-options

defaults write com.apple.Safari 'NSWindow Frame BrowserWindowFrame' '0 0 1024 685 0 0 1024 746'
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write com.apple.Safari AlwaysShowTabBar -bool true
defaults write com.apple.Safari BlockStoragePolicy -int 2
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultTextEncodingName -string 'utf-8'
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ShouldPrintBackgrounds -bool false
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 1
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true
defaults write com.apple.Safari DownloadsClearingPolicy -int 2
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false
defaults write com.apple.Safari HomePage -string 'https://mail.milliped.com'
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari NewTabBehavior -int 1
defaults write com.apple.Safari NewWindowBehavior -int 0
defaults write com.apple.Safari PrintHeadersAndFooters -bool false
defaults write com.apple.Safari ProxiesInBookmarksBar '()'
defaults write com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool true
defaults write com.apple.Safari SendDoNotTrackHTTPHeader -bool true
defaults write com.apple.Safari ShowFavoritesBar -bool false
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true
defaults write com.apple.Safari ShowSidebarInTopSites -bool false
defaults write com.apple.Safari ShowStatusBar -bool true
defaults write com.apple.Safari SuppressSearchSuggestions -bool true
defaults write com.apple.Safari TabCreationPolicy -int 2
defaults write com.apple.Safari UniversalSearchEnabled -bool false
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string 'utf-8'
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitInitialTimedLayoutDelay 0.25
defaults write com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false
defaults write com.apple.Safari WebKitShouldPrintBackgroundsPreferenceKey -bool false
defaults write com.apple.Safari WebKitStorageBlockingPolicy -int 1
defaults write com.apple.Safari WebKitTabToLinksPreferenceKey -bool true
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool true
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
