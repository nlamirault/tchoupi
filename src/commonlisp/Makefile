# Copyright (C) 2014, 2015  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP = tchoupi

SHELL = /bin/bash

VERSION=$(shell \
        grep "version" tchoupi.asd \
	|awk -F'"' '{print $$2}')


NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

ROSWELL_HOME=$(HOME)/.roswell
ROSWELL_BRANCH = master


all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- clean$(NO_COLOR)  : cleanup$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- init$(NO_COLOR)   : install tools$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- deps$(NO_COLOR)   : install dependencies$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- test$(NO_COLOR)   : launch unit tests$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- binary$(NO_COLOR) : build executable$(NO_COLOR)"

.PHONY: clean
clean:
	@echo -e "$(OK_COLOR)[$(APP)] Cleanup$(NO_COLOR)"
	@rm roswell/tchoupi

.PHONY: init
init:
	@echo -e "$(OK_COLOR)[clacman] Install dependencies$(NO_COLOR)"
	@curl -L https://raw.githubusercontent.com/snmsts/roswell/$(ROSWELL_BRANCH)/scripts/install-for-ci.sh | sh
	@ros install qlot

.PHONY: deps
deps:
	@qlot install :tchoupi
	@ln -sf `pwd`/*.asd  quicklisp/local-projects/

.PHONY: test
test: deps
	@echo -e "$(OK_COLOR)[$(APP)] Launch unit tests$(NO_COLOR)"
	@qlot exec run-prove tchoupi-test.asd

.PHONY: binary
binary:
	@echo -e "$(OK_COLOR)[$(APP)] Build binary$(NO_COLOR)"
	@ros build roswell/tchoupi.ros

.PHONY: run
run:
	@echo -e "$(OK_COLOR)[$(APP)] Run$(NO_COLOR)"
	@clackup src/app.lisp
