MKFILE_WORDS  := $(words $(MAKEFILE_LIST))
MKFILE_PATH 	:= $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR 	 	:= $(dir $(MKFILE_PATH))

all: home/directories home/dotfiles home/dotfiles/config nvim/astrovim

nvim/astrovim:
	git submodule update --init;    \
	nvim_dir="$$HOME/.config/nvim"; \
	rm -rf "$$nvim_dir"; \
	ln -s $(MKFILE_DIR)config/astrovim $$nvim_dir;  \
	nvim --headless -c 'quitall';

home/directories:
	mkdir -p $$HOME/dev

home/dotfiles/config:
	rm -if "$$HOME/.config/df"; 			\
	mkdir -p "$$HOME/.config"; 			\
	ln -s "$(MKFILE_DIR)config" "$$HOME/.config/df"

home/dotfiles:
	for df in $$(find "$(MKFILE_DIR)config/home" -type f); do	\
		home_name=".$$(basename $$df)";				\
		dest="$$HOME/$$home_name";				\
		[ -e "$$dest" ] && echo "Cleaning $$dest";  		\
		rm -f "$$dest" && ln -s "$$df" "$$dest"; 		\
	done

clean:
	rm -if "$$HOME/.config/df";  \
	rm -if "$$HOME/.config/nvim"; \
	rm -if "$$HOME/.config/astrovim/lua/user"; \
	rm -rf "$$HOME/.local/share/nvim"; \
	rm -rf "$$HOME/.local/state/nvim"; \
	rm -rf "$$HOME/.cache/nvim";

.PHONY: all clean
