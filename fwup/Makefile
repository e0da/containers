PREFIX = $(HOME)/.local/bin
BIN = fwup

install:
	docker build -t fwup .
	install -m 0755 "$(BIN)" "$(PREFIX)"
