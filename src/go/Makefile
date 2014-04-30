
export HOME=$(CURDIR)
export GOPATH=$(HOME)/.tchoupigo

PKG = tchoupi Makefile
VERSION=$(shell cat github.com/nlamirault/tchoupi/settings.go | perl -n -e'/Version = "(.*?)"/ && print $$1')

init:
	mkdir -p $(GOPATH)/src/
	cp -r ./github.com $(GOPATH)/src/github.com
	go get github.com/tools/godep

deps:
	$(GOPATH)/bin/godep restore

update-deps:
	$(GOPATH)/bin/godep get github.com/nlamirault/tchoupi
	$(GOPATH)/bin/godep save github.com/nlamirault/tchoupi

build: init deps
	cp -r ./github.com/nlamirault $(GOPATH)/src/github.com
	go build github.com/nlamirault/tchoupi

test: build
	go test github.com/nlamirault/tchoupi

# deps2:
# 	cp -r ./github.com/nlamirault $(GOPATH)/src/github.com
# 	$(GOPATH)/bin/godep get github.com/nlamirault/tchoupi

# deps_save: deps
# 	$(GOPATH)/bin/godep save github.com/nlamirault/tchoupi

# deps_restore:
# 	$(GOPATH)/bin/godep restore

package: $(PKG)
	mkdir -p tchoupi-$(VERSION)
	cp -r $(PKG) tchoupi-$(VERSION)/
	tar -cvzf tchoupi-$(VERSION).tar.gz  tchoupi-$(VERSION)
	rm -rf tchoupi-$(VERSION)/

clean:
	rm -f tchoupi-$(VERSION).tar.gz
	rm -rf tchoupi-$(VERSION)/
	rm -f ./tchoupi
	rm -fr $(GOPATH)

.PHONY: clean
