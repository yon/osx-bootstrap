#!/usr/bin/env bash

# Safari preferences configuration
# Sources:
# - https://github.com/joeyhoer/starter/blob/master/apps/safari.sh
# - https://apple.stackexchange.com/questions/309702/set-default-finder-view-and-arrange-by-options

# IMPORTANT: You must grant Terminal "Full Disk Access" in System Settings -> Privacy & Security
# This is required for Safari's sandboxed preferences to be modified

# Safari window and session settings
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari 'NSWindow Frame BrowserWindowFrame' '0 0 1280 1050 0 0 1680 1050'  # Set default window size and position
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false  # Don't restore session at launch
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari AlwaysShowTabBar -bool true  # Always show tab bar
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari BlockStoragePolicy -int 2  # Block storage policy (2 = block all)

# WebKit2 engine settings
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ApplePayCapabilityDisclosureAllowed -bool true  # Allow Apple Pay capability disclosure
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DefaultTextEncodingName -string 'utf-8'  # Set default text encoding to UTF-8
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true  # Enable Web Inspector
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2JavaScriptCanOpenWindowsAutomatically -bool false  # Prevent JavaScript from opening windows automatically
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2ShouldPrintBackgrounds -bool false  # Don't print page backgrounds
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2StorageBlockingPolicy -int 1  # Set storage blocking policy
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2TabsToLinks -bool true  # Enable tabbing through links

# Safari behavior settings
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari DownloadsClearingPolicy -int 2  # Clear downloads list policy
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false  # Find matches anywhere in words, not just at start
# defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari HomePage -string 'about:blank'  # Set homepage (customize as needed)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari HomePage -string 'https://mail.milliped.com'  # Custom homepage (update for your use)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari IncludeDevelopMenu -bool true  # Show Develop menu in menu bar
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NewTabBehavior -int 1  # New tab behavior (1 = homepage)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari NewWindowBehavior -int 0  # New window behavior (0 = homepage)

# Safari printing and privacy settings
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari PrintHeadersAndFooters -bool false  # Don't print headers and footers
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ProxiesInBookmarksBar '()'  # Clear proxies in bookmarks bar
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ReadingListSaveArticlesOfflineAutomatically -bool true  # Automatically save Reading List articles for offline reading
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SendDoNotTrackHTTPHeader -bool true  # Send Do Not Track header

# Safari interface and search settings
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFavoritesBar -bool false  # Hide favorites bar
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowFullURLInSmartSearchField -bool true  # Show full URL in address bar
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowSidebarInTopSites -bool false  # Hide sidebar in top sites
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari ShowStatusBar -bool true  # Show status bar
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari SuppressSearchSuggestions -bool true  # Disable search suggestions
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari TabCreationPolicy -int 2  # Tab creation policy
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari UniversalSearchEnabled -bool false  # Disable Spotlight suggestions in Smart Search Field

# Legacy WebKit settings (for compatibility with older Safari versions)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitDefaultTextEncodingName -string 'utf-8'  # Set default text encoding to UTF-8
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true  # Enable Web Inspector (legacy setting)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitInitialTimedLayoutDelay 0.25  # Set initial layout delay
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitJavaScriptCanOpenWindowsAutomatically -bool false  # Prevent JavaScript from opening windows (legacy)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitShouldPrintBackgroundsPreferenceKey -bool false  # Don't print backgrounds (legacy)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitStorageBlockingPolicy -int 1  # Set storage blocking policy (legacy)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebKitTabToLinksPreferenceKey -bool true  # Enable tabbing through links (legacy)
defaults write ~/Library/Containers/com.apple.Safari/Data/Library/Preferences/com.apple.Safari WebsiteSpecificSearchEnabled -bool true  # Enable website-specific search

# Global WebKit developer extras (affects all WebKit-based apps)
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true                     # Enable Web Inspector globally
