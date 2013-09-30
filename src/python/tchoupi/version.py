#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

from flask import Blueprint, json, jsonify
from tchoupi import __version__
from tchoupi.commons import make_webservice_response


api_version = Blueprint('api_version', __name__,
                        template_folder='templates')


@api_version.route('/version')
def show():
    return make_webservice_response(json.dumps({'version': __version__}),
                                    200)
