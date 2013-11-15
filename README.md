Tchoupi
=======

## Description

A REST webservice implemented in differents langages. To verify the webservice:

    $ curl http://localhost:8085
	$ curl http://localhost:8085/version

## Virtual machine

You could creates a development environment from scratch:

### Install VirtualBox

See [VirtualBox](https://www.virtualbox.org/wiki/Downloads)

### Install Vagrant and plugins

Install [Vagrant](https://www.vagrantup.com) (testted on 1.3.5), and install
the [Vocker](https://github.com/fgrehm/vocker) plugin :

	$ vagrant plugin install vocker

### Launch

    $ vagrant up
	$ vagrant ssh


## Manual configuration

### Python

* Install Python tools :

        $ sudo apt-get install python-pip
		$ sudo pip install virtualenv virtualenvwrapper

* Setup development environment :

        $ . /usr/local/bin/virtualenvwrapper.sh
		$ mkvirtualenv tchoupi
		New python executable in tchoupi/bin/python
		Installing Setuptools........done.
		Installing Pip...............done.
		$ pip install -r requirements.txt

* Launch unit tests:

        $ tox (-ecoverage)

* Lanch the REST webservice :

        $ ./runserver.py


### Common Lisp

* Install [SBCL](http://www.sbcl.org):

        $ sudo apt-get install sbcl

* Install [Quicklisp](http://www.quicklisp.org):

        $ curl -O http://beta.quicklisp.org/quicklisp.lisp
		$ sbcl --load quicklisp.lisp
		sbcl> (quicklisp-quickstart:install)
		sbcl> (ql:quickload "quicklisp-slime-helper")

* Add the project to *quicklisp* local projects:

        $ ln -s $TCHOUPI_HOME/src/commonlisp/*.asd $QUICKLISP_HOME/local-projects/

* Using [SBCL](http://www.sbcl.org) or [SLIME](http://common-lisp.net/project/slime):

        $ (ql:quickload "tchoupi")
        $ (ql:quickload "tchoupi-test")
		$ (setq lisp-unit:*print-failures* t)
		$ (setq lisp-unit:*print-errors* t)
		$ (setq lisp-unit:*print-summary* t)
		$ (lisp-unit:run-tests :all :tchoupi-test)

* Launch unit tests:

        $ sbcl --script ./test/runtests.lisp


### GO

* Install [Go](http://golang.org):

        $ apt-get -u install golang golang-go golang-doc golang-src

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


### OCaml

* Install [OCaml](http://ocaml.org/):

        $ sudo apt-get install ocaml ocaml-findlib

* Install [OPam](http://opam.ocamlpro.com/):

        $ sudo add-apt-repository ppa:avsm/ppa
		$ sudo apt-get update
		$ sudo apt-get install opam

* Install [OASIS](http://oasis.forge.ocamlcore.org):

        $ sudo apt-get -u install oasis


### Erlang

* Install [Erlang](http://www.erlang.org/) using [Erlang Solutions](https://www.erlang-solutions.com):

        $ deb http://packages.erlang-solutions.com/debian raring contrib
		$ wget http://packages.erlang-solutions.com/debian/erlang_solutions.asc
		$ sudo apt-key add erlang_solutions.asc
		$ sudo apt-get update
		$ sudo apt-get install erlang erlang-doc erlang-manpages erlang-mode

* Get dependencies using [Rebar](https://github.com/rebar/rebar):

        $ ./rebar get-deps

* Compile and launch:

        $ make compile start

* From the Erlang shell, type : *application:which_applications().*:

        erl> application:which_applications().
		[{tchoupi,"The Tchoupi webservice","0.1.0"},
		{cowboy,"Small, fast, modular HTTP server.","0.8.6"},
		{ranch,"Socket acceptor pool for TCP protocols.","0.8.4"},
		{crypto,"CRYPTO version 2","3.0"},
		{stdlib,"ERTS  CXC 138 10","1.19.3"},
		{kernel,"ERTS  CXC 138 10","2.16.3"}]

You can use *Ctrl-G q* to exit the Erlang shell.


### Haskell

* Install [Haskell](http://www.haskell.org):

        $ sudo apt-get install ghc

* Install the [Cabal](http://www.haskell.org/cabal/) package manager:

        $ sudo apt-get install cabal-install

* Install the [Snap](http://snapframework.com) framework :

        $ cabal update
		$ cabal install snap
		$ PATH=$HOME/.cabal/bin:$PATH

* Compile and launch :

        $ make install
		$ $HOME/.cabal/bin/tchoupi -p 8085


## Copyright

Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
