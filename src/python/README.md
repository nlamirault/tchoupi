# Tchoupi Python

* Install Python tools :
- [python-pip](https://github.com/pypa/pip)
- [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org)

* Setup development environment :

        $ wget https://bootstrap.pypa.io/get-pip.py
        $ sudo python get-pip.py
        $ sudo pip install virtualenv
        $ virtualenv venv
        $ . venv/bin/activate
		$ pip install -r requirements.txt
   		$ pip install -r requirements-dev.txt

* Launch unit tests:

        $ tox (-ecoverage)

* Lanch the REST webservice :

        $ ./runserver.py
