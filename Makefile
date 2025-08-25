# Branch detection for remote operations
BRANCH ?= $(shell git branch --show-current 2>/dev/null || git symbolic-ref refs/remotes/origin/HEAD 2>/dev/null | sed 's@^refs/remotes/origin/@@' || echo "master")

.PHONY:	default
default: help

.PHONY: bootstrap
bootstrap:	brew-bundle osx-preferences dotfiles

.PHONY:	brew
brew:	xcode-cli-tools /opt/homebrew/bin/brew

/opt/homebrew/bin/brew:
	@/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

.PHONY: brew-bundle
brew-bundle:	brew
	@if [ -f $(CURDIR)/Brewfile ]; then \
		echo "Installing from local Brewfile..."; \
		/opt/homebrew/bin/brew bundle install --file=$(CURDIR)/Brewfile; \
	else \
		echo "Installing from remote Brewfile (branch: $(BRANCH))..."; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/Brewfile | /opt/homebrew/bin/brew bundle install --file=-; \
	fi

.PHONY: brew-bundle-dump
brew-bundle-dump:	brew
	@/opt/homebrew/bin/brew bundle dump --file=$(CURDIR)/Brewfile --force

.PHONY: brew-upgrade
brew-upgrade:	brew
	@/opt/Homebrew/bin/brew update --force && \
	  /opt/Homebrew/bin/brew list | xargs /opt/Homebrew/bin/brew upgrade --force --quiet && \
	  /opt/Homebrew/bin/brew cleanup --prune=all

.PHONY: dotfiles
dotfiles:
	@echo "Setting up dotfiles..."
	@curl -fsSL https://raw.githubusercontent.com/yon/dotfiles/main/Makefile | make -f - default
	@echo "Dotfiles setup complete!"

.PHONY: help
help:
	@echo "Available targets:"
	@echo "  default          - Help"
	@echo "  bootstrap        - Perform full OSX Bootstrap"
	@echo "  brew             - Install Homebrew"
	@echo "  brew-bundle      - Install packages from Brewfile"
	@echo "  brew-bundle-dump - Export installed packages to Brewfile"
	@echo "  brew-upgrade     - Update and upgrade all packages"
	@echo "  dotfiles         - Setup dotfiles"
	@echo "  help             - Show this help message"
	@echo "  osx-preferences  - Apply macOS system preferences"
	@echo "  xcode-cli-tools  - Install Xcode Command Line Tools"

.PHONY: osx-preferences
osx-preferences:
	@echo "Applying macOS preferences..."
	@if [ -f $(CURDIR)/preferences/system.sh ]; then \
		echo "Applying macOS preferences from local files..."; \
		bash $(CURDIR)/preferences/system.sh; \
		bash $(CURDIR)/preferences/finder.sh; \
		bash $(CURDIR)/preferences/dock.sh; \
		bash $(CURDIR)/preferences/keyboard.sh; \
		bash $(CURDIR)/preferences/safari.sh; \
		bash $(CURDIR)/preferences/chrome.sh; \
		bash $(CURDIR)/preferences/terminal.sh; \
		bash $(CURDIR)/preferences/spaces.sh; \
		bash $(CURDIR)/preferences/istat-menus.sh; \
		bash $(CURDIR)/preferences/rectangle.sh; \
		echo "Local preferences applied successfully!"; \
	else \
		echo "Applying macOS preferences from remote files (branch: $(BRANCH))..."; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/system.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/finder.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/dock.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/keyboard.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/safari.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/chrome.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/terminal.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/spaces.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/istat-menus.sh | bash; \
		curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/$(BRANCH)/preferences/rectangle.sh | bash; \
		echo "Remote preferences applied successfully!"; \
	fi
	@echo "macOS preferences applied successfully!"

.PHONY: xcode-cli-tools
xcode-cli-tools:	/Library/Developer/CommandLineTools/usr/bin/clang

/Library/Developer/CommandLineTools/usr/bin/clang:
	@echo "Installing Xcode Command Line Tools..."; \
	xcode-select --install 2>/dev/null || { \
		echo "Searching for Command Line Tools in software updates..."; \
		touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress; \
		PROD=$$(softwareupdate --list 2>&1 | grep -B 1 "Command Line Tools" | head -n 1 | awk -F"*" '{print $$2}' | sed -e 's/^ *//' | tr -d '\n'); \
		if [ -n "$$PROD" ]; then \
			echo "Found: $$PROD"; \
			softwareupdate --install "$$PROD" --verbose; \
		else \
			echo "Could not find Command Line Tools in software update list"; \
			echo "Please run: xcode-select --install"; \
			exit 1; \
		fi; \
		rm -f /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress; \
	}; \
	@echo "Verifying Xcode Command Line Tools installation..."; \
	@xcode-select -p >/dev/null 2>&1 && test -f /Library/Developer/CommandLineTools/usr/bin/clang || { \
		echo "ERROR: Xcode Command Line Tools installation verification failed"; \
		echo "Please try running: xcode-select --install"; \
		exit 1; \
	}; \
	@echo "Xcode Command Line Tools successfully installed and verified"
