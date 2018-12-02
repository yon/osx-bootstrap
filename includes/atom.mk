.PHONY:	atom
atom:	brew /usr/local/bin/atom

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
