# Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP="tchoupi"

CABAL=cabal

SHELL = /bin/bash

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)init$(NO_COLOR)  :  Install requirements"
	@echo -e "$(WARN_COLOR)build$(NO_COLOR) :  Build project"
	@echo -e "$(WARN_COLOR)run$(NO_COLOR) :  Run application"

.PHONY: init
init:
	$(CABAL) install --constraint 'mono-traversable >= 0.9' stack
	$(CABAL) install

.PHONY: configure
configure:
	$(CABAL) configure

.PHONY: build
build: configure
	$(CABAL) build

.PHONY: run
run: build
	dist/build/tchoupi/tchoupi

.PHONY: clean
clean:
	$(CABAL) clean
