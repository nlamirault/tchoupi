#!/bin/bash
# -*- coding: UTF8 -*-

virtualenv .venv
. .venv/bin/activate
pip install -r requirements.txt
tox
