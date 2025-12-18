RIME_DIR := $(shell cd $(HOME)/Library/Rime 2>/dev/null && /bin/pwd -P || echo $(HOME)/Library/Rime)

.PHONY: default ext rime
default:
	brew bundle --verbose
ext:
	brew bundle --file=BrewfileExt --verbose
rime:
	mkdir -p "$(RIME_DIR)"
	cp -R rime/. "$(RIME_DIR)/"
