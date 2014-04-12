# Tchoupi Python

* Install Python tools :
- [python-pip](https://github.com/pypa/pip)
- [virtualenvwrapper](http://virtualenvwrapper.readthedocs.org)

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
