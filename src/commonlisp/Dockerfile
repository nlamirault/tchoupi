FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get update
RUN apt-get install -y nginx supervisor sbcl

# install Quicklisp
RUN apt-get install -y curl
RUN mkdir -p /opt/apps/commonlisp/
RUN cd /opt/apps/commonlisp/ && curl -O http://beta.quicklisp.org/quicklisp.lisp

# Nginx
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

# Supervisord
ADD ./supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

ADD src /opt/tchoupi/ &&
ADD tchoupi.lisp /opt/tchoupi/

# nginx
EXPOSE 80

CMD ["/usr/bin/supervisord"]
