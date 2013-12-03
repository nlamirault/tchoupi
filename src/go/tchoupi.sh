#!/bin/bash
# -*- coding: UTF8 -*-

TCHOUPI_HOME=`pwd`/.tchoupigo
rm -fr $TCHOUPI_HOME
mkdir $TCHOUPI_HOME
export GOPATH=$TCHOUPI_HOME
export PATH=$PATH:$GOPATH/bin
cp -r ./github.com $GOPATH/src/
cd $GOPATH/src
cp -r ../../github.com .
cd ../..
make
make test

