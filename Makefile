SHELL = /bin/sh

GOOS ?= linux
GOARCH ?= amd64

.PHONY: all clean

backend: cmd/backend/backend.go
	CGO_ENABLED=1 GOOS=$(GOOS) GOARCH=$(GOARCH) go build -a -tags netgo -ldflags '-w -extldflags "-static"' -o $@ $<
