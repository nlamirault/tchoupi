FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get update
RUN apt-get install -y wget nginx supervisor
RUN apt-get clean

# Install Go
RUN apt-get install -y golang golang-go golang-doc golang-src

RUN mkdir -p /opt/tchoupi
ADD github.com /opt/tchoupi/github.com
ADD Makefile /opt/tchoupi
RUN cd /opt/tchoupi && make

# Nginx
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

# Supervisord
ADD ./supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# nginx
EXPOSE 80

CMD ["/usr/bin/supervisord"]
