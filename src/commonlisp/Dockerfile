FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx supervisor sbcl
RUN apt-get clean

# install Quicklisp
RUN apt-get install -y curl
RUN mkdir -p /opt/apps/commonlisp/
RUN cd /opt/apps/commonlisp/ && curl -O http://beta.quicklisp.org/quicklisp.lisp

ADD src /opt/tchoupi/src
ADD tchoupi.lisp /opt/tchoupi

# Nginx
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

# Supervisord
ADD ./supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# nginx
EXPOSE 80

CMD ["/usr/bin/supervisord"]
