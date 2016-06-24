# Copyright (C) 2014, 2015, 2016  Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP="tchoupi"

SHELL = /bin/bash

REBAR = ./rebar3

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

VERSION=$(shell \
        grep "VERSION" apps/tchoupi/src/tchoupi.hrl \
        |awk -F',' '{print $$2}' \
        |sed -e "s/[^0-9.]//g" \
	|sed -e "s/ //g")

all: help

.PHONY: help
help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)init$(NO_COLOR)     :  Install requirements"
	@echo -e "$(WARN_COLOR)deps$(NO_COLOR)     :  Install dependencies"
	@echo -e "$(WARN_COLOR)build$(NO_COLOR)    :  Compile project"
	@echo -e "$(WARN_COLOR)run$(NO_COLOR)      :  Run application"
	@echo -e "$(WARN_COLOR)test$(NO_COLOR)     :  Launch unit tests"

.PHONY: init
init:
	@echo -e "$(OK_COLOR)[$(APP)] Install requirements$(NO_COLOR)"
	wget https://s3.amazonaws.com/rebar3/rebar3 -O ./rebar3 && \
                chmod +x ./rebar3

.PHONY: deps
deps:
	@echo -e "$(OK_COLOR)[$(APP)] Retrieve dependencies$(NO_COLOR)"
	@$(REBAR) deps
	@$(REBAR) vendor store

.PHONY: build
build: deps
	@echo -e "$(OK_COLOR)[$(APP)] Build application$(NO_COLOR)"
	@$(REBAR) compile

.PHONY: run
run: deps
	@echo -e "$(OK_COLOR)[$(APP)] Run application$(NO_COLOR)"
	@$(REBAR) run

.PHONY: test
test: build
	@echo -e "$(OK_COLOR)[$(APP)] Testing$(NO_COLOR)"
	@$(REBAR) as test ct

.PHONY: release
release: build
	@echo -e "$(OK_COLOR)[$(APP)] Release application$(NO_COLOR)"
	@$(REBAR) release

.PHONY: clean
clean:
	@echo -e "$(OK_COLOR)[$(APP)] Clean environment$(NO_COLOR)"
	@$(REBAR) clean && rm -f test/*.beam erl_crash.dump
