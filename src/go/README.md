# Tchoupi GO

* Install [Go](http://golang.org):

* Configure environment:

        $ export GOPATH=$HOME/Apps/golang
		$ export PATH=$PATH:$GOPATH/bin
		$ mkdir $GOPATH/src/github.com/nlamirault/
		$ ln -s `pwd`/tchoupi $GOPATH/src

* Build and launch unit tests:

        $ make
		$ make test

* Lanch the REST webservice :

        $ ./tchoupi
