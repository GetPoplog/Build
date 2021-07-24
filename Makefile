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

.PHONY: install
install:
	$(MAKE) -C Seed install

.PHONY: tarball
tarball:
	$(MAKE) -C Seed clean
	$(MAKE) -C Seed use-repos
	$(MAKE) -C Seed download
	VERSION="$$(cat Seed/VERSION)"; \
	ASSEMBLY_DIR="$$(mktemp -d)"; \
	POPLOG_DIST_NAME="poplog-$$VERSION"; \
	POPLOG_TAR_DIR="$$ASSEMBLY_DIR/$$POPLOG_DIST_NAME"; \
	mkdir -p "$$POPLOG_TAR_DIR"; \
	cp -r Seed Makefile README.md "$$POPLOG_TAR_DIR"; \
	rm -f "poplog-$$VERSION.tar.gz"; \
	tar -C $$ASSEMBLY_DIR -czvf "poplog-$$VERSION.tar.gz" "$$POPLOG_DIST_NAME"; \
	rm -rf "$$ASSEMBLY_DIR"
