.PHONY:	google-chrome
google-chrome:	brew /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome google-chrome-preferences

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome:
	/usr/local/bin/brew cask install google-chrome

.PHONY:	google-chrome-preferences
google-chrome-preferences:
	$(notdir $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))/../preferences/google-chrome.sh
