.PHONY:	default
default: \
	atom \
	brew \
	cleanmymac \
	dropbox \
	google-chrome \
	istat-menus \
	keybase \
	keychain \
	osx-preferences

.PHONY:	1password
1password:	brew /Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7

/Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7:
	/usr/local/bin/brew cask install 1password

include includes/atom.mk

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

include includes/google-chrome.mk

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
	preferences/system.sh
	preferences/finder.sh
	preferences/safari.sh
	preferences/terminal.sh

.PHONY:	vmware-fusion
vmware-fusion:	brew /Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion

/Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion:
	/usr/local/bin/brew cask install vmware-fusion

.PHONY:	whatsapp
whatsapp:	brew /Applications/WhatsApp.app/Contents/MacOS/WhatsApp

/Applications/WhatsApp.app/Contents/MacOS/WhatsApp:
	/usr/local/bin/brew cask install whatsapp
