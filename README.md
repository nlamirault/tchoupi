# Tchoupi

[![Build Status](http://img.shields.io/travis/nlamirault/tchoupi.svg)](https://travis-ci.org/nlamirault/tchoupi)

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

See each README.md in [src](src)

## Copyright

Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
