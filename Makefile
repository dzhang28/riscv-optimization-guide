# Makefile for RISC-V Optimization Guide
#
# This work is licensed under the Creative Commons Attribution-ShareAlike 4.0
# International License. To view a copy of this license, visit
# http://creativecommons.org/licenses/by-sa/4.0/ or send a letter to
# Creative Commons, PO Box 1866, Mountain View, CA 94042, USA.
#
# SPDX-License-Identifier: CC-BY-SA-4.0
#
# Description:
# 
# This Makefile is designed to automate the process of building and packaging 
# the documentation for RISC-V Optimization Guide. It supports multiple build
# targets  for generating documentation in various formats (PDF, HTML).

# For live rendering, run `make -j continuous-rebuild serve`

# Default target builds all
all: riscv-optimization-guide

# Asciidoctor options
ASCIIDOCTOR_OPTS := -a compress \
                    --attribute=mathematical-format=svg \
                    --failure-level=INFO \
                    --verbose \
                    --trace

.PHONY: riscv-optimization-guide
riscv-optimization-guide: public/riscv-optimization-guide.pdf

public/riscv-optimization-guide.pdf: riscv-optimization-guide.adoc *.adoc
	@echo "Building $@"
	rm -f $@.tmp
	asciidoctor-pdf $(ASCIIDOCTOR_OPTS) --out-file=$@.tmp $<
	mv $@.tmp $@


.PHONY: riscv-optimization-guide
riscv-optimization-guide: public/riscv-optimization-guide.html

public/riscv-optimization-guide.html: riscv-optimization-guide.adoc *.adoc
	@echo "Building $@"
	asciidoctor $(ASCIIDOCTOR_OPTS) --out-file=$@ $<

.PHONY: continuous-rebuild
continuous-rebuild:
	make # do it a first time so that the file is there even if unmodified yet
	# You can install inotifywait with inotify-tools for example
	while inotifywait -e close_write *.adoc; do make; done

.PHONY: serve
serve:
	@echo "Open http://localhost:8080/riscv-optimization-guide.html in your browser"
	cd public && python3 -m http.server 8080
