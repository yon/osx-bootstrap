.PHONY:	default
default: \
	1password \
	atom \
	brew \
	cleanmymac \
	dropbox \
	google-chrome \
	istat-menus \
	keybase \
	keychain \
	osx-preferences \
	slack \
	whatsapp \
	zoomus

.PHONY:	1password
1password:	brew /Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7

/Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7:
	/usr/local/bin/brew cask install 1password

.PHONY:	atom
atom:	brew /usr/local/bin/atom atom-packages

/usr/local/bin/atom:
	/usr/local/bin/brew cask install atom

.PHONY:	atom-packages
atom-packages:	atom-haskell plist-converter pretty-json sort-lines teletype

.PHONY:	atom-haskell
atom-haskell:	$(HOME)/.atom/packages/atom-haskell

$(HOME)/.atom/packages/atom-haskell:	/usr/local/bin/apm
	/usr/local/bin/apm install atom-haskell

.PHONY:	plist-converter
plist-converter:	$(HOME)/.atom/packages/plist-converter

$(HOME)/.atom/packages/plist-converter:	/usr/local/bin/apm
	/usr/local/bin/apm install plist-converter

.PHONY:	pretty-json
pretty-json:	$(HOME)/.atom/packages/pretty-json

$(HOME)/.atom/packages/pretty-json:	/usr/local/bin/apm
	/usr/local/bin/apm install pretty-json

.PHONY:	sort-lines
sort-lines:	$(HOME)/.atom/packages/sort-lines

$(HOME)/.atom/packages/sort-lines:	/usr/local/bin/apm
	/usr/local/bin/apm install sort-lines

.PHONY:	teletype
teletype:	$(HOME)/.atom/packages/teletype

$(HOME)/.atom/packages/teletype:	/usr/local/bin/apm
	/usr/local/bin/apm install teletype

.PHONY:	brew
brew:	/usr/local/bin/brew

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY:	cleanmymac
cleanmymac:	brew /Applications/CleanMyMac\ X.app/Contents/MacOS/CleanMyMac\ X

/Applications/CleanMyMac\ X.app/Contents/MacOS/CleanMyMac\ X:
	/usr/local/bin/brew cask install cleanmymac

.PHONY:	dropbox
dropbox:	brew /Applications/Dropbox.app/Contents/MacOS/Dropbox

/Applications/Dropbox.app/Contents/MacOS/Dropbox:
	/usr/local/bin/brew cask install dropbox

.PHONY:	google-chrome
google-chrome:	brew /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome google-chrome-preferences

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome:
	/usr/local/bin/brew cask install google-chrome

.PHONY:	google-chrome-preferences
google-chrome-preferences:
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/google-chrome.sh | bash

.PHONY:	istat-menus
istat-menus:	brew /Applications/iStat\ Menus.app/Contents/MacOS/iStat\ Menus

/Applications/iStat\ Menus.app/Contents/MacOS/iStat\ Menus:
	/usr/local/bin/brew cask install istat-menus

.PHONY:	keybase
keybase:	brew /Applications/Keybase.app/Contents/MacOS/Keybase

/Applications/Keybase.app/Contents/MacOS/Keybase:
	/usr/local/bin/brew cask install keybase

.PHONY:	keychain
keychain:	brew /usr/local/bin/keychain

/usr/local/bin/keychain:
	/usr/local/bin/brew install keychain

.PHONY: osx-preferences
osx-preferences:
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/system.sh | bash
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/finder.sh | bash
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/safari.sh | bash
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.sh | bash

.PHONY:	slack
slack:	brew /Applications/Slack.app/Contents/MacOS/Slack

/Applications/Slack.app/Contents/MacOS/Slack:
	/usr/local/bin/brew cask install slack

.PHONY:	vmware-fusion
vmware-fusion:	brew /Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion

/Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion:
	/usr/local/bin/brew cask install vmware-fusion

.PHONY:	whatsapp
whatsapp:	brew /Applications/WhatsApp.app/Contents/MacOS/WhatsApp

/Applications/WhatsApp.app/Contents/MacOS/WhatsApp:
	/usr/local/bin/brew cask install whatsapp

.PHONY:	zoomus
zoomus:	brew /Applications/zoom.us.app/Contents/MacOS/zoom.us

/Applications/zoom.us.app/Contents/MacOS/zoom.us:
	/usr/local/bin/brew cask install zoomus
