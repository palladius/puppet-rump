
MAKE = /usr/bin/make

help:
	@echo Help: compile clean pull push.

# Then make the submodule as well!
compile:
	git submodule init && git submodule update
	@echo Recursively make dir: external/
	$(MAKE) --directory=externals/

clean:
	@echo 'rump: TODO cleanup (maybe destroy dir and git pull from scratch)'
	$(MAKE) clean --directory=externals/

pull:
	git pull origin master
	git submodule update
	git submodule foreach git pull origin master
	cd externals/ricpuppet && git pull

push:
	git push origin master
