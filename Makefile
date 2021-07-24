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
	[[ -d Seed/_build/Base ]] || $(MAKE) -C Seed use-repos
	$(MAKE) -C Seed build

.PHONY: tarball
tarball:
	$(MAKE) -C Seed clean
	$(MAKE) -C Seed use-repos
	$(MAKE) -C Seed download
	VERSION="$$(cat Seed/VERSION)"; \
	POPLOG_TAR_DIR="poplog-$$VERSION"; \
	mkdir -p "$$POPLOG_TAR_DIR"; \
	cp -r Seed Makefile README.md "$$POPLOG_TAR_DIR"; \
	tar -czvf "poplog-$$VERSION.tar.gz" "$$POPLOG_TAR_DIR"; \
	rm -rf "$$POPLOG_TAR_DIR"

