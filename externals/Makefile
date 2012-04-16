
MAKE    := make
SUBDIRS := jamtur1_puppet-irc ricpuppet

# makes all SUBDIRS (TODO: auto get them)

all: compile

compile $(SUBDIRS):
	@echo externals: Recursively make dir external sons: '$@'..
	@for dir in $(player) $(SUBDIRS);   \
	do                                 \
	  $(MAKE) --directory=$$dir;       \
	done

clean:
	@echo externals: TODO cleanup submodules
