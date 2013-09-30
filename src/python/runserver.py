#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

import site
import sys


site.addsitedir('~/venvs/local/lib/python2.7/site-packages')

from tchoupi import app

app.run(host="0.0.0.0", port=8085)
