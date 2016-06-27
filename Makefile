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


APP = tchoupi

NAMESPACE = tchoupi

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

DOCKER=docker
MACHINE_VERSION=0.0.1
MACHINE_URL=https://github.com/docker/machine/releases/download

all: help

help:
	@echo -e "$(OK_COLOR) ==== $(APP) ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)- init$(NO_COLOR)   : initialize environment"
	@echo -e "$(WARN_COLOR)- build$(NO_COLOR)  : build the Docker images"

init:
	@echo -e "$(OK_COLOR)[$(APP)] Download Docker machine$(NO_COLOR)"
	wget $(MACHINE_URL)/$(MACHINE_VERSION)/linux -O machine
	chmod +x ./machine
	./machine -d virtualbox tchoupi

commonlisp:
	@echo -e "$(OK_COLOR)[$(APP)] Build Common Lisp$(NO_COLOR)"
	@sudo $(DOCKER) build -t $(NAMESPACE)/commonlisp src/commonlisp

python:
	@echo -e "$(OK_COLOR)[$(APP)] Build Python$(NO_COLOR)"
	@sudo $(DOCKER) build -t $(NAMESPACE)/python src/python

go:
	@echo -e "$(OK_COLOR)[$(APP)] Build GO$(NO_COLOR)"
	@sudo $(DOCKER) build -t $(NAMESPACE)/go src/go

ocaml:
	@echo -e "$(OK_COLOR)[$(APP)] Build GO$(NO_COLOR)"
	@sudo $(DOCKER) build -t $(NAMESPACE)/go src/go

build: commonlisp python go
