SHELL := /usr/bin/env fish

all: fmt lint

fmt:
	@fish_indent --write **.fish

lint:
	@for file in **.fish; fish --no-execute $$file; end

.PHONY: \
	all \
	fmt \
	lint
