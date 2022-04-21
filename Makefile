MAKEFILE_DIR := $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST)))))

all: directories

directories: ~/dev $(NVIM_DIRS)
	$(foreach d, $^, mkdir -p $(d); $(newline))

clean:
	rm -if "$$HOME/.config/df"

.PHONY: all clean
