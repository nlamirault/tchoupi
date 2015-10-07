# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
#
# Copyright (c) Orange Applications for Business.
#

import flask

from tchoupi.api import version

def creates_app():
    app = flask.Flask(__name__,
                      static_folder='static',
                      template_folder='templates')
    app.config.from_pyfile('settings.py')
    app.register_blueprint(version.rest)
    return app
