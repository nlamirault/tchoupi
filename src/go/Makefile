PKG = tchoupi Makefile
VERSION=$(shell cat tchoupi/version.go | perl -n -e'/Version = "(.*?)"/ && print $$1')

build:
	go build github.com/nlamirault/tchoupi

test:
	go test github.com/nlamirault/tchoupi

package: $(PKG)
	mkdir -p tchoupi-$(VERSION)
	cp -r $(PKG) tchoupi-$(VERSION)/
	tar -cvzf tchoupi-$(VERSION).tar.gz  tchoupi-$(VERSION)
	rm -rf tchoupi-$(VERSION)/

clean:
	rm -f tchoupi-$(VERSION).tar.gz
	rm -rf tchoupi-$(VERSION)/
	rm -f ./tchoupi

.PHONY: clean
