default:	atom brew cleanmymac dropbox google-chrome istat-menus keybase keychain osx-preferences

1password:	brew /Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7

/Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7:
	/usr/local/bin/brew cask install 1password

atom:	brew /usr/local/bin/atom

/usr/local/bin/atom:
	/usr/local/bin/brew cask install atom

atom-packages:	atom-haskell plist-converter pretty-json sort-lines teletype

atom-haskell:	$(HOME)/.atom/packages/atom-haskell

$(HOME)/.atom/packages/atom-haskell:	/usr/local/bin/apm
	/usr/local/bin/apm install atom-haskell

plist-converter:	$(HOME)/.atom/packages/plist-converter

$(HOME)/.atom/packages/plist-converter:	/usr/local/bin/apm
	/usr/local/bin/apm install plist-converter

pretty-json:	$(HOME)/.atom/packages/pretty-json

$(HOME)/.atom/packages/pretty-json:	/usr/local/bin/apm
	/usr/local/bin/apm install pretty-json

sort-lines:	$(HOME)/.atom/packages/sort-lines

$(HOME)/.atom/packages/sort-lines:	/usr/local/bin/apm
	/usr/local/bin/apm install sort-lines

teletype:	$(HOME)/.atom/packages/teletype

$(HOME)/.atom/packages/teletype:	/usr/local/bin/apm
	/usr/local/bin/apm install teletype

brew:	/usr/local/bin/brew

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cleanmymac:	brew /Applications/CleanMyMac\ X.app/Contents/MacOS/CleanMyMac\ X

/Applications/CleanMyMac\ X.app/Contents/MacOS/CleanMyMac\ X:
	/usr/local/bin/brew cask install cleanmymac

dropbox:	brew /Applications/Dropbox.app/Contents/MacOS/Dropbox

/Applications/Dropbox.app/Contents/MacOS/Dropbox:
	/usr/local/bin/brew cask install dropbox

google-chrome:	brew /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome google-chrome-preferences

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome:
	/usr/local/bin/brew cask install google-chrome

google-chrome-preferences:
	preferences/google-chrome.sh

istat-menus:	brew /Applications/iStat\ Menus.app/Contents/MacOS/iStat\ Menus

/Applications/iStat\ Menus.app/Contents/MacOS/iStat\ Menus:
	/usr/local/bin/brew cask install istat-menus

keybase:	brew /Applications/Keybase.app/Contents/MacOS/Keybase

/Applications/Keybase.app/Contents/MacOS/Keybase:
	/usr/local/bin/brew cask install keybase

keychain:	brew /usr/local/bin/keychain

/usr/local/bin/keychain:
	/usr/local/bin/brew install keychain

osx-preferences:
	preferences/system.sh
	preferences/safari.sh
	preferences/terminal.sh

vmware-fusion:	brew /Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion

/Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion:
	/usr/local/bin/brew cask install vmware-fusion

whatsapp:	brew /Applications/WhatsApp.app/Contents/MacOS/WhatsApp

/Applications/WhatsApp.app/Contents/MacOS/WhatsApp:
	/usr/local/bin/brew cask install whatsapp

.PHONY:	1password all atom atom-packages brew cleanmymac dropbox google-chrome \
	istat-menus keybase keychain osx-preferences vmware-fusion whatsapp
