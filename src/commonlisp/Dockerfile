# Copyright (C) 2014-2016 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#     http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# FROM alpine:edge
FROM fisxoj/common-lisp-sbcl:201606
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

# RUN apk update && \
#     apk add bash make automake autoconf gcc curl sbcl --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ \
#     && rm -rf /var/cache/apk/*

RUN mkdir -p /opt
COPY . /opt/tchoupi

CMD ["sbcl"]
