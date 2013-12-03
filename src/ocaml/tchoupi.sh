#!/bin/bash

export OPAMYES=1
rm -rf ~/.opam
opam init
opam install cohttp ounit ocp-build
