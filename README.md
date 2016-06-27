# Tchoupi

[![License Apache 2][badge-license]](LICENSE)
[![Build Status](http://img.shields.io/travis/nlamirault/tchoupi.svg)](https://travis-ci.org/nlamirault/tchoupi)

## Description

You could validate each version using a script :

```bash
$ .tchoupi.sh
-----------------
---- Tchoupi ----
-----------------
- Python :
...... -> [OK]
- Go :
.. -> [OK]
- Common Lisp :
................ -> [OK]
- OCaml :
.... -> [OK]
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

See [LICENSE](LICENSE) for the complete license.


## Changelog

A changelog is available [here](ChangeLog.md).


## Contact

Nicolas Lamirault <nicolas.lamirault@gmail.com>



[Tchoupi]: https://github.com/nlamirault/tchoupi
[badge-license]: https://img.shields.io/badge/license-Apache2-green.svg?style=flat
[Issue tracker]: https://github.com/nlamirault/tchoupi/issues


[Docker]: https://www.docker.io
