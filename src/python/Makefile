# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-

# Copyright (c) 2014, 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

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

VERSION=$(shell \
        grep release tchoupi/version.py \
        |awk -F'=' '{ print $$2 }' \
        |sed -e "s/[' ]//g")

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)init$(NO_COLOR)  :   Init dependencies"
	@echo -e "$(WARN_COLOR)clean$(NO_COLOR) :   Cleanup"
	@echo -e "$(WARN_COLOR)run$(NO_COLOR)   :   Run the application"

.PHONY: clean
clean:
	@echo -e "$(OK_COLOR)[$(APP)] Nettoyage de l'environnement$(NO_COLOR)"
	@find tchoupi -name "*.pyc" | xargs rm -fr
	@find tchoupi -name "__pycache__" | xargs rm -fr
	@rm -fr $(APP)-webapp-V* *.egg-info

.PHONY: init
init:
	@echo -e "$(OK_COLOR)[$(APP)] Initialisation de l'environnement$(NO_COLOR)"
	test -d venv || virtualenv --python=/usr/bin/python3.4 venv
	. venv/bin/activate && \
		pip install -r requirements.txt	 && \
		pip install -r requirements-dev.txt

.PHONY: test
test:
	@echo -e "$(OK_COLOR)[$(APP)] Execution des tests unitaires$(NO_COLOR)"
	. venv/bin/activate && tox -r

.PHONY: run
run:
	@echo -e "$(OK_COLOR)[$(APP)] Start$(NO_COLOR)"
	. venv/bin/activate && ./wsgi.py
