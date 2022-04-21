MKFILE_WORDS  := $(words $(MAKEFILE_LIST))
MKFILE_PATH 	:= $(abspath $(lastword $(MAKEFILE_LIST)))
MKFILE_DIR 	 	:= $(dir $(MKFILE_PATH))

all: home/directories nvim/config nvim/config/ftplugin home/dotfiles home/dotfiles/config

home/directories:
	mkdir -p $$HOME/dev

home/dotfiles/config:
	rm -if "$$HOME/.config/df"; 								\
	mkdir -p "$$HOME/.config"; 									\
	ln -s "$(MKFILE_DIR)config" "$$HOME/.config/df"

home/dotfiles:
	for df in $$(find "$(MKFILE_DIR)config/home" -type f); do 			\
		home_name=".$$(basename $$df)";																\
		dest="$$HOME/$$home_name";																		\
		[ -e "$$dest" ] && echo "Cleaning $$dest";  									\
		rm -f "$$dest" && ln -s "$$df" "$$dest"; 											\
	done 																												

nvim/config:
	for f in $$(find "$(MKFILE_DIR)config/nvim" -type f -depth 1); do \
		nvim_dir="$$HOME/.config/nvim"; 																\
		mkdir -p $$nvim_dir;																						\
		dest="$$nvim_dir/$$(basename $$f)"; 														\
		[ -e "$$dest" ] && echo "Cleaning $$dest";    									\
		rm -f "$$dest" && ln -s "$$f" "$$dest"; 												\
	done

nvim/config/ftplugin:
	for f in $$(find "$(MKFILE_DIR)config/nvim/ftplugin" -type f); do \
		nvim_dir="$$HOME/.config/nvim/ftplugin";												\
		mkdir -p $$nvim_dir;																						\
		dest="$$nvim_dir/$$(basename $$f)"; 														\
		[ -e "$$dest" ] && echo "Cleaning $$dest";    									\
		rm -f "$$dest" && ln -s "$$f" "$$dest"; 												\
	done

clean:
	rm -if "$$HOME/.config/df"

.PHONY: all clean
