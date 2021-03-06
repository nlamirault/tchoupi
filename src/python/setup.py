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
