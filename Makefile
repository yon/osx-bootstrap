.PHONY:	default
default: \
	brew \
	brew-bundle \
	dotfiles

.PHONY:	brew
brew:	/opt/homebrew/bin/brew

/opt/homebrew/bin/brew:
	@/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: brew-bundle
brew-bundle:	brew
	@if [ -f $(CURDIR)/Brewfile ]; then \
		echo "Installing from local Brewfile..."; \
		/opt/homebrew/bin/brew bundle install --file=$(CURDIR)/Brewfile; \
	else \
		echo "Installing from remote Brewfile..."; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/Brewfile | /opt/homebrew/bin/brew bundle install --file=-; \
	fi

.PHONY: brew-bundle-dump
brew-bundle-dump:	brew
	@/opt/homebrew/bin/brew bundle dump --file=$(CURDIR)/Brewfile --force

.PHONY: osx-preferences
osx-preferences:
	@echo "Applying macOS preferences..."
	@if [ -f $(CURDIR)/preferences/system.sh ]; then \
		echo "Applying macOS preferences from local files..."; \
		bash $(CURDIR)/preferences/system.sh; \
		bash $(CURDIR)/preferences/finder.sh; \
		bash $(CURDIR)/preferences/dock.sh; \
		bash $(CURDIR)/preferences/safari.sh; \
		bash $(CURDIR)/preferences/terminal.sh; \
		bash $(CURDIR)/preferences/rectangle.sh; \
		echo "Local preferences applied successfully!"; \
	else \
		echo "Applying macOS preferences from remote files..."; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/system.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/finder.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/dock.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/safari.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/terminal.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/preferences/rectangle.sh | bash; \
		echo "Remote preferences applied successfully!"; \
	fi
	@echo "macOS preferences applied successfully!"

.PHONY: dotfiles
dotfiles:
	@echo "Setting up dotfiles..."
	@curl -fsSL https://raw.githubusercontent.com/yon/dotfiles/main/Makefile | make -f - default
	@echo "Dotfiles setup complete!"
