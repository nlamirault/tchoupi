#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

__version__ = '0.1.0'


from flask import Flask, jsonify
from tchoupi.version import api_version


app = Flask(__name__, static_folder='static', template_folder='templates')
app.config.from_pyfile('settings.py')
app.register_blueprint(api_version)
app.logger.info("[Tchoupi] Start webservice")


@app.errorhandler(405)
def page_not_found(e):
    return jsonify(error=409, text=e), 409
