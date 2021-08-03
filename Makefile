.PHONY: all
all: build

.PHONY: help
help:
	# Valid targets are:
	#   clean
	#   build
	#   install
	#   jumpstart-* [^] - and more, try `make help-jumpstart`.

.PHONY: help-jumpstart
help-jumpstart:
	$(MAKE) -C Seed $@

.PHONY: clean
clean:
	$(MAKE) -C Seed clean

.PHONY: build
build:
	[ -d Seed/_download/Base ] || cp -rpP Base Seed/_download/Base
	[ -d Seed/_download/Corepops ] || cp -rpP Base Seed/_download/Corepops
	$(MAKE) -C Seed build

.PHONY: install
install:
	$(MAKE) -C Seed install
