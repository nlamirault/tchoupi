#!/bin/bash
# -*- coding: UTF8 -*-

TCHOUPI_HOME=`pwd`

echo "-------------------------------------"
echo "----- Python version of Tchoupi -----"
echo "-------------------------------------"
cd src/python
./tchoupi.sh
cd $TCHOUPI_HOME

echo "------------------------------------------"
echo "----- Common Lisp version of Tchoupi -----"
echo "------------------------------------------"
cd src/commonlisp
./tchoupi.sh
cd $TCHOUPI_HOME

echo "---------------------------------"
echo "----- GO version of Tchoupi -----"
echo "---------------------------------"
cd src/go
./tchoupi.sh
cd $TCHOUPI_HOME

echo "------------------------------------"
echo "----- OCaml version of Tchoupi -----"
echo "------------------------------------"
cd src/ocaml
./tchoupi.sh
cd $TCHOUPI_HOME

