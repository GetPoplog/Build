.PHONY: all
all:
	$(MAKE) build
	# Target "all" completed

.PHONY: help
help:
	# Valid targets are:
	#   clean
	#   build
	#   install
	#   jumpstart-ubuntu [^] - installs the packages a Ubuntu system needs.
	#   jumpstart-fedora [^] - installs the packages a Fedora system needs.
	#   jumpstart-* [^] - and more, try `make help-jumpstart`.

.PHONY: help-jumpstart
help-jumpstart:
	$(MAKE) -C Seed $@

.PHONY: clean
clean:
	$(MAKE) -C Seed clean

.PHONY: build
build:
	$(MAKE) -C Seed use-repos
	$(MAKE) -C Seed build