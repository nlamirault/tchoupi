# Tchoupi Common Lisp

## Required softwares

You will need :

* [SBCL][]
* [Quicklisp][]

## Installation

* Install tools and dependencies :

        $ make init
        $ make deps

* Make binary :

        $ make binary

* Launch server:

        $ roswell/tchoupi

## Development

* Install [roswell][] to setup the Common Lisp environment and install
your Common Lisp implementation using it.:

        $ make init
        $ ros install sbcl

* Install dependencies :

        $ make deps

* Launch unit tests :

        $ make test
