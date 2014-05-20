# Tchoupi

[![License GPL 3][badge-license]][COPYING]
[![Build Status](http://img.shields.io/travis/nlamirault/tchoupi.svg)](https://travis-ci.org/nlamirault/tchoupi)

## Description

You could validate each version using a script :

```bash
$ .tchoupi.sh
-----------------
---- Tchoupi ----
-----------------
 - Python : ... [OK]
 - GO : .. [OK]
 - Common Lisp : .................................. [OK]
```

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

See each README.md in [src](src)


## Support

Feel free to ask question or make suggestions in our [Issue Tracker][].


## License

Scame is free software: you can redistribute it and/or modify it under the
terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

Tchoupi is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

See [COPYING][] for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>

[Tchoupi]: https://github.com/nlamirault/tchoupi
[Docker]: https://www.docker.io
[COPYING]: https://github.com/nlamirault/tchoupi/blob/master/COPYING
[badge-license]: https://img.shields.io/badge/license-GPL_3-green.svg?style=flat
[Issue tracker]: https://github.com/nlamirault/tchoupi/issues
