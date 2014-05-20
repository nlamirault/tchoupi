#!/bin/bash

# Copyright (C) 2014  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

set -e
set -x
export PROJECT=tchoupi
export TEST_ENV=$PWD/.clenv

cleanup() {
    rm -fr $TEST_ENV
    mkdir $TEST_ENV
}

init() {
    cp ci/init.lisp $TEST_ENV
    cd $TEST_ENV
    wget -q http://beta.quicklisp.org/quicklisp.lisp -O quicklisp.lisp
    sbcl --script init.lisp
    ln -s $PWD/.. ./.quicklisp/local-projects/$PROJECT
    cd ..
}

ci() {
    sbcl --script ci/$PROJECT-ci.lisp
}

cleanup
init
ci
