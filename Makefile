
MAKE = /usr/bin/make

help:
	@echo Help: compile clean install pull push.

# Then make the submodule as well!
compile:
	git submodule init && git submodule update
	@echo Recursively make dir: external/
	$(MAKE) --directory=externals/

install:
	sudo apt-get install -y rubygems git
	sudo gem install rump puppet liquid
	bin/create-auto-manifest-for-host.rb

clean:
	@echo 'rump: TODO cleanup (maybe destroy dir and git pull from scratch)'
	$(MAKE) clean --directory=externals/

pull:
	git pull origin master
	git submodule update
	git submodule foreach git pull origin master
	cd externals/ricpuppet && git pull

push:
	@echo this only makes sense for Riccardo
	#cd externals/ricpuppet && git push origin master
	git push origin master

check:
	@echo 'Check that all files are checked out, symlinks are not broken, ...'
