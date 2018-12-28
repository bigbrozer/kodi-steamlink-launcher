SHELL = /bin/bash

BUNDLE = kodi-steamlink-launcher
PLUGIN_RESOURCES = plugin.program.steamlink

.PHONY: dist
dist: dist-clean
	@mkdir -p dist
	@7z a -tzip dist/$(BUNDLE).zip $(PLUGIN_RESOURCES)

.PHONY: clean
clean:
	@rm -f dist/*.zip

.PHONY: dist-clean
dist-clean:
	@rm -rf dist/
