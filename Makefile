SKETCH_TOOL = /Applications/Sketch.app/Contents/Resources/sketchtool/bin/sketchtool
ICON_SET = default
TARGET = default

icons/default/default.iconset: icons/default/Icons.sketch
	$(SKETCH_TOOL) export slices icons/default/Icons.sketch --output=icons/default/ && md5 icons/default/Icons.sketch > icons/default/default.iconset

install: icons/$(ICON_SET)/$(ICON_SET).iconset icons/$(ICON_SET)/mappings.yml
	scripts/patch.rb $(ICON_SET) '$(TARGET)'

uninstall: icons/$(ICON_SET)/mappings.yml
	scripts/restore.rb $(ICON_SET) '$(TARGET)'
