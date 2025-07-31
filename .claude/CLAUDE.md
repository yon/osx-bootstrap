# CLAUDE.md - Project Context for osx-bootstrap

## Overview
This is a macOS bootstrap repository that automates the setup of a new Mac with development tools, applications, and system preferences. The project uses Makefile-driven automation and can be run either locally or remotely via curl.

## Project Structure
```
osx-bootstrap/
├── Brewfile            # Homebrew bundle file with all packages to install
├── Makefile            # Main automation file with targets for setup
├── README.md           # User documentation
├── osx-bootstrap.sh    # Entry point script for remote installation
├── preferences/        # macOS system preference scripts
│   ├── chrome.sh       # Chrome browser settings
│   ├── dock.sh         # Dock appearance and behavior
│   ├── finder.sh       # Finder preferences
│   ├── istat-menus.sh  # iStat Menus configuration
│   ├── keyboard.sh     # Keyboard settings
│   ├── rectangle.sh    # Rectangle window manager settings
│   ├── safari.sh       # Safari browser settings
│   ├── spaces.sh       # Mission Control/Spaces settings
│   ├── system.sh       # General system preferences
│   └── terminal.sh     # Terminal.app preferences
└── scripts/            # Helper scripts
    ├── keyboard-capture.sh
    ├── spaces-capture.sh
    └── spaces-count.sh

```

## Key Commands

### Installation
- **Remote install**: `curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/osx-bootstrap.sh | bash`
- **Local Homebrew packages**: `make brew-bundle`
- **Apply preferences**: `make osx-preferences`
- **Update Brewfile**: `make brew-bundle-dump`

### Testing
- **Check shell script syntax**: `bash -n preferences/*.sh`
- **Verify changes**: `git status` and `git diff`

## Important Details

### Makefile Targets
1. **default**: Runs brew, brew-bundle, and dotfiles
2. **brew**: Installs Homebrew if not present
3. **brew-bundle**: Installs packages from Brewfile (local or remote)
4. **brew-bundle-dump**: Updates Brewfile with currently installed packages
5. **osx-preferences**: Applies all macOS system preferences
6. **dotfiles**: Sets up dotfiles from separate repository

### Preference Scripts Execution Order
When running `make osx-preferences`, scripts execute in this order:
1. system.sh (prompts for hostname)
2. finder.sh
3. dock.sh
4. keyboard.sh
5. safari.sh
6. chrome.sh
7. terminal.sh
8. spaces.sh
9. istat-menus.sh
10. rectangle.sh

### Security Considerations
- Terminal needs "Full Disk Access" in System Settings for Safari preferences
- Scripts can run both locally and remotely (via curl)
- Administrator password required for system.sh (hostname changes)
- All preference scripts should be executable (chmod +x)

### Development Workflow
1. Make changes to preference scripts or Brewfile
2. Test syntax: `bash -n preferences/*.sh`
3. Run locally: `make osx-preferences` or `make brew-bundle`
4. Commit changes when satisfied
5. Remote installations will use the committed version from GitHub

## Notes for Future Development
- When adding new preference scripts, remember to:
  1. Create the script in `preferences/`
  2. Make it executable with `chmod +x`
  3. Add it to both local and remote sections in Makefile
  4. Update README.md documentation
- Consider adding error handling for missing directories
