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

build: commonlisp python go
