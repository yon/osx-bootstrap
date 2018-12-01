default:	atom brew cleanmymac dropbox google-chrome istat-menus keychain whatsapp

1password:	brew /Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7

/Applications/1Password\ 7.app/Contents/MacOS/1Password\ 7:
	brew cask install 1password

atom:	brew /usr/local/bin/atom

/usr/local/bin/atom:
	brew cask install atom

brew:	/usr/local/bin/brew

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

cleanmymac:	brew /Applications/CleanMyMac\ X.app/Contents/MacOS/CleanMyMac\ X

/Applications/CleanMyMac\ X.app/Contents/MacOS/CleanMyMac\ X:
	brew cask install cleanmymac

dropbox:	brew /Applications/Dropbox.app/Contents/MacOS/Dropbox

/Applications/Dropbox.app/Contents/MacOS/Dropbox:
	brew cask install dropbox

google-chrome:	brew /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome:
	brew cask install google-chrome

istat-menus:	brew /Applications/iStat\ Menus.app/Contents/MacOS/iStat\ Menus

/Applications/iStat\ Menus.app/Contents/MacOS/iStat\ Menus:
	brew cask install istat-menus

keychain:	brew /usr/local/bin/keychain

/usr/local/bin/keychain:
	brew install keychain

vmware-fusion:	brew /Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion

/Applications/VMware\ Fusion.app/Contents/MacOS/VMware\ Fusion:
	brew cask install vmware-fusion

whatsapp:	brew /Applications/WhatsApp.app/Contents/MacOS/WhatsApp

/Applications/WhatsApp.app/Contents/MacOS/WhatsApp:
	brew cask install whatsapp

.PHONY:	1password all atom brew cleanmymac dropbox google-chrome istat-menus keychain vmware-fusion whatsapp
