
MAKE = /usr/bin/make

# Then make the submodule as well!
compile:
	git submodule init && git submodule update
	@echo Recursively make dir: external/
	$(MAKE) --directory=externals/

clean:
	@echo 'rump: TODO cleanup (maybe destroy dir and git pull from scratch)'
	$(MAKE) clean --directory=externals/