#!/bin/bash

# Copyright (C) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

red='\e[0;31m'
yellow='\033[33;01m'
green='\e[0;0;32m'
nocolor='\e[0m'

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
        printf "${green} -> [OK]${nocolor}\n"
    else
        printf "${red} -> [KO]${nocolor}\n"
    fi
}

tchoupi_python() {
    printf "${yellow}- Python : ${nocolor}\n"
    cd src/python
    rm -f /tmp/tchoupi_python.log
    make clean init test &> /tmp/tchoupi_python.log &
    tchoupi_check_status $! /tmp/tchoupi_python.log "congratulations :)"
    cd $HOME
}

tchoupi_golang() {
    printf "${yellow}- Go : ${nocolor}\n"
    cd src/go
    rm -f /tmp/tchoupi_go.log
    make docker-build
    make docker-test > /tmp/tchoupi_go.log 2>&1 &
    tchoupi_check_status $! /tmp/tchoupi_go.log "FAIL"
    cd $HOME
}

tchoupi_commonlisp() {
    printf "${yellow}- Common Lisp : ${nocolor}\n"
    cd src/commonlisp
    make init test &> /tmp/tchoupi_commonlisp.log &
    tchoupi_check_status $! /tmp/tchoupi_commonlisp.log " tests completed"
    cd $HOME
}

tchoupi_ocaml() {
    printf "${yellow}- OCaml : ${nocolor}\n"
    cd src/ocaml
    make build test &> /tmp/tchoupi_ocaml.log &
    tchoupi_check_status $! /tmp/tchoupi_ocaml.log "congratulations"
    cd $HOME
}

tchoupi_erlang() {
    printf "${yellow}- Erlang : ${nocolor}\n"
    cd src/ocaml
    make build test &> /tmp/tchoupi_erlang.log &
    tchoupi_check_status $! /tmp/tchoupi_erlang.log "congratulations"
    cd $HOME
}


main() {
    echo -e "-----------------"
    echo -e "---- Tchoupi ----"
    echo -e "-----------------"
    # tchoupi_python
    tchoupi_golang
    # tchoupi_commonlisp
    # tchoupi_ocaml
}


main
