#!/bin/bash

# Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA
# 02110-1301, USA.


red='\e[0;31m'
green='\e[0;0;32m'
nocolor='\e[0m' # No Color

SCRIPT=`readlink -f $0`
HOME=`dirname $SCRIPT`

SLEEP=1 # 0.8

display_waiting() {
    pid=$1
    #echo $pid
    while kill -0 $pid &>/dev/null
    do
        echo -n "."
        sleep $SLEEP
    done
}

tchoupi_check_status() {
    pid=$1
    logs=$2
    token=$3
    #echo "Check $token into $logs"
    display_waiting $pid
    grep -q "$token" $logs
    tchoupi_display_status $?
}

tchoupi_display_status() {
    result=$1
    if [ $result = 0 ]
    then
        printf "${green} [OK]${nocolor}\n"
    else
        printf "${red} [KO]${nocolor}\n"
    fi
}

tchoupi_python() {
    printf " - Python : "
    cd src/python
    ./tchoupi.sh &> /tmp/tchoupi_python.logs &
    tchoupi_check_status $! /tmp/tchoupi_python.logs "congratulations"
    cd $HOME
}

tchoupi_golang() {
    printf " - GO : "
    cd src/go
    #./tchoupi.sh &> /tmp/tchoupi_go.logs &
    make clean test &> /tmp/tchoupi_go.logs &
    tchoupi_check_status $! /tmp/tchoupi_go.logs "ok  	github.com/nlamirault/tchoupi"
    cd $HOME
}

tchoupi_commonlisp() {
    printf " - Common Lisp : "
    cd src/commonlisp
    ./ci/tchoupi-ci.sh &> /tmp/tchoupi_cl.logs &
    tchoupi_check_status $! /tmp/tchoupi_cl.logs " | 0 failed"
    cd $HOME
}


main() {
    echo -e "-----------------"
    echo -e "---- Tchoupi ----"
    echo -e "-----------------"
    tchoupi_python
    tchoupi_golang
    tchoupi_commonlisp
}


main
