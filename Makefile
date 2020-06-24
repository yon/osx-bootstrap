.PHONY:	default
default: \
	brew \
	brew-bundle \
	osx-preferences

.PHONY:	brew
brew:	/usr/local/bin/brew

/usr/local/bin/brew:
	/usr/bin/ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

.PHONY: brew-bundle
brew-bundle:	brew
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/brewfile/Brewfile | /usr/local/bin/brew bundle install --file=-

.PHONY: osx-preferences
osx-preferences:
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/system.sh | bash
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/finder.sh | bash
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/safari.sh | bash
	curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.sh | bash
