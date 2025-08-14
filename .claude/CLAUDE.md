# CLAUDE.md - Project Context for osx-bootstrap

## Overview
This is a macOS bootstrap repository that automates the setup of a new Mac with development tools, applications, and system preferences. The project uses Makefile-driven automation and can be run either locally or remotely via curl.

## Project Structure
```
osx-bootstrap/
├── Brewfile            # Homebrew bundle file with all packages to install
├── Makefile            # Main automation file with targets for setup
├── README.md           # User documentation
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
- **Remote install**: `curl -fsSL https://raw.githubusercontent.com/yon/osx-bootstrap/master/Makefile | make -f - bootstrap`
- **Local install**: `make bootstrap`

Run `make help` to see all available targets, or review the Makefile directly for implementation details and dependencies.

### Testing
- **Check shell script syntax**: `bash -n preferences/*.sh`
- **Verify changes**: `git status` and `git diff`

## Important Details

### Security Considerations
- Terminal needs "Full Disk Access" in System Settings for Safari preferences
- Scripts prioritize local files when available, fall back to remote via curl
- Administrator password required for system.sh (hostname changes)
- All preference scripts should be executable (chmod +x)
- Branch detection: defaults to current branch, falls back to origin HEAD, then 'master'

### Development Workflow
1. Make changes to preference scripts or Brewfile
2. Test syntax: `bash -n preferences/*.sh`
3. Run locally to test changes
4. Commit changes when satisfied
5. Remote installations will use the committed version from GitHub

## Notes for Future Development
- When adding new preference scripts, remember to:
  1. Create the script in `preferences/`
  2. Make it executable with `chmod +x`
  3. Add it to both local and remote sections in Makefile
- Consider adding error handling for missing directories
