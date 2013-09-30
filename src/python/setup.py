#!/usr/bin/env python
# -*- coding: utf-8 -*-
# -*- Mode: Python; tab-width: 4 -*-
# Copyright (c) Nicolas Lamirault <nicolas.lamirault@gmail.com>
try:
    from setuptools import setup, find_packages
except ImportError:
    from ez_setup import use_setuptools
    use_setuptools()
    from setuptools import setup, find_packages

setup(
    name='tchoupi',
    version='0.1',
    description='Tchoupi',
    author='Nicolas Lamirault',
    author_email='nicolas.lamirault@gmail.com',
    test_suite='tchoupi',
    zip_safe=False,
    include_package_data=True,
    packages=find_packages(exclude=['ez_setup'])
)
