# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

import flask

from tchoupi.api import commons
from tchoupi import settings


rest = flask.Blueprint('version',
                       __name__,
                       template_folder='templates')


@rest.route('/version', methods=['GET'])
def api_version():
    flask.current_app.logger.info("[API] Get version")
    version = {'version': settings.API_VERSION}
    return commons.make_webservice_response(flask.json.dumps(version),
                                            200)
