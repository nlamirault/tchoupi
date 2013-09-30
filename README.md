Tchoupi
=======

Description
-----------

A REST webservice implemented in differents langages. To verify the webservice:

    $ curl http://localhost:8085
	$ curl http://localhost:8085/version


Python
------

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

GO
--

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


Copyright
---------

Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
