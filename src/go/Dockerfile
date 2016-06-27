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

FROM golang:1.6
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN \
  wget https://github.com/Masterminds/glide/releases/download/0.10.2/glide-0.10.2-linux-amd64.tar.gz && \
  tar xvf glide-0.10.2-linux-amd64.tar.gz && \
  mv linux-amd64/glide /usr/bin/

ENV GO15VENDOREXPERIMENT=1
COPY . /go/src/github.com/nlamirault/tchoupi
RUN cd /go/src/github.com/nlamirault/tchoupi && make deps && make build
RUN cp /go/src/github.com/nlamirault/tchoupi/tchoupi /usr/bin/

WORKDIR "/go/src/github.com/nlamirault/tchoupi"

VOLUME ["/data/"]

EXPOSE 8080

CMD ["tchoupi", "-d"]
