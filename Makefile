.PHONY:	default
default: \
	brew \
	brew-bundle

.PHONY:	brew
brew:	/opt/homebrew/bin/brew

/opt/homebrew/bin/brew:
	@/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: brew-bundle
brew-bundle:	brew
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/Brewfile | /opt/homebrew/bin/brew bundle install --file=-

.PHONY: brew-bundle-dump
brew-bundle-dump:	brew
	@/opt/homebrew/bin/brew bundle dump --file=$(CURDIR)/Brewfile --force

.PHONY: osx-preferences
osx-preferences:
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/system.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/finder.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/safari.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.sh | bash
	@curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/rectangle.sh | bash
