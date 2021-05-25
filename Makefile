SHELL = /bin/sh

GOOS ?= linux
GOARCH ?= amd64

.PHONY: all clean

all: backend assets/backend.db

clean: backend assets/backend.db
	$(RM) $^

backend: cmd/backend/backend.go $(shell find . -name '*.go')
	CGO_ENABLED=1 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o $@ $<

assets/%.db: scripts/%.sh
	$(SHELL) $< $@

