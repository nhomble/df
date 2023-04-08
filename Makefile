MKFILE_WORDS  := $(words $(MAKEFILE_LIST))
MKFILE_PATH 	:= $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR 	 	:= $(dir $(MKFILE_PATH))

all: home/directories home/dotfiles home/dotfiles/config nvim/astrovim

nvim/astrovim:
	git submodule update --init;    \
	nvim_dir="$$HOME/.config/nvim"; \
	rm -rf "$$nvim_dir"; \
	ln -s $(MKFILE_DIR)external/AstroNvim $$nvim_dir;  \
	rm -rf "$(MKFILE_DIR)external/AstroNvim/lua/user"; \
	ln -s $(MKFILE_DIR)config/astrovim "$(MKFILE_DIR)external/AstroNvim/lua/user"; \
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
	rm -if "$$HOME/.config/astrovim/lua/user";


.PHONY: all clean
