#!/bin/bash
# -*- coding: UTF8 -*-

TCHOUPI_HOME=`pwd`

echo "----- Python version of Tchoupi -----"
cd src/python
./tchoupi.sh
cd $TCHOUPI_HOME

echo "----- Common Lisp version of Tchoupi -----"
cd src/commonlisp
./tchoupi.sh
cd $TCHOUPI_HOME

echo "----- GO version of Tchoupi -----"
cd src/go
./tchoupi.sh
cd $TCHOUPI_HOME
