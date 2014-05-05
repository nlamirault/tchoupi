export HOME=$(shell pwd)
export GOPATH=$(HOME)/.goenv

GOBUILD_OPTS      :=

PKG = tchoupi Makefile
VERSION=$(shell cat github.com/nlamirault/tchoupi/settings.go | perl -n -e'/Version = "(.*?)"/ && print $$1')

init:
	mkdir -p $(GOPATH)/src/
	cp -r ./github.com $(GOPATH)/src/github.com
	@echo "Building godep..."
	go get github.com/tools/godep
	@env GOPATH="${GOPATH}" go get ${GOBUILD_OPTS} github.com/tools/godep

setup: init
	@echo "Restoring deps with godep..."
	@env GOPATH="${GOPATH}" ${GOPATH}/bin/godep restore

update-deps:
	$(GOPATH)/bin/godep get github.com/nlamirault/tchoupi
	$(GOPATH)/bin/godep save github.com/nlamirault/tchoupi

build: init setup
	cp -r ./github.com/nlamirault $(GOPATH)/src/github.com
	go build github.com/nlamirault/tchoupi

test: build
	@echo "Running tests"
	go test github.com/nlamirault/tchoupi

coverage: build
	go test github.com/nlamirault/tchoupi -covermode=count -coverprofile=count.out
	#go tool cover -html=count.out -o coverage.html
	go tool cover -func=count.out

package: $(PKG)
	mkdir -p tchoupi-$(VERSION)
	cp -r $(PKG) tchoupi-$(VERSION)/
	tar -cvzf tchoupi-$(VERSION).tar.gz  tchoupi-$(VERSION)
	rm -rf tchoupi-$(VERSION)/

clean:
	rm -f tchoupi-$(VERSION).tar.gz
	rm -rf tchoupi-$(VERSION)/
	rm -f ./tchoupi
	rm -f count.out coverage.html
	rm -fr $(GOPATH)

.PHONY: clean
