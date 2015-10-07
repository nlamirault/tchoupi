# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>

import flask


def make_webservice_response(data, status_code=None, message=None):
    """Creates the HTTP response.

    :param data: the response content
    :param status_code: the HTTP return code
    """
    response = flask.jsonify({'status': status_code, 'message': message})
    response.status_code = status_code
    response.data = data
    response.headers['Content-Type'] = 'application/json'
    flask.current_app.logger.info("Response: %s %s" % (status_code, data))
    return response
