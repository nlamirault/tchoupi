#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>


from flask import json
import logging
import tchoupi
import unittest

logger = logging.getLogger(__name__)


class TchoupiApiTestCase(unittest.TestCase):

    def setUp(self):
        self.app = tchoupi.app.test_client()

    def tearDown(self):
        pass

    def check_content_type(self, response):
        logger.info("Response: %s %s" % (response.status, response.data))
        self.assertEquals("application/json",
                          response.headers.get("Content-Type"))

    def http_get(self, uri):
        return self.app.get(uri, follow_redirects=True)


class ApiVersionTestCase(TchoupiApiTestCase):

    def test_get_version_without_auth(self):
        response = self.http_get("/version")
        self.check_content_type(response)
        self.assertEquals("200 OK", response.status)
        version = json.loads(response.data)
        self.assertEqual('0.1.0', version['version'])
