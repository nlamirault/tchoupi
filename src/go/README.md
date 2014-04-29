# Tchoupi GO

* Install [Go](http://golang.org):

* Configure environment:

        $ export GOPATH=$HOME/Apps/golang
		$ export PATH=$PATH:$GOPATH/bin
		$ mkdir -p $GOPATH/src/github.com/nlamirault/
		$ ln -s `pwd`/github.com/nlamirault/tchoupi/ $GOPATH/src/github.com/nlamirault/

* Build and launch unit tests:

        $ make
		$ make test

* Lanch the REST webservice :

        $ ./tchoupi
