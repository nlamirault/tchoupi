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

import flask

from tchoupi.api import commons


rest = flask.Blueprint('hello',
                       __name__,
                       template_folder='templates')


@rest.route('/', methods=['GET'])
def api_default():
    flask.current_app.logger.info("[API] Get root")
    return commons.make_webservice_response("Welcome to Tchoupi", 200)
