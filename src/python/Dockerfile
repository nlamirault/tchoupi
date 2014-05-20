FROM ubuntu:14.04
MAINTAINER Nicolas Lamirault <nicolas.lamirault@gmail.com>

RUN apt-get update
RUN apt-get install -y wget python git nginx supervisor
RUN apt-get clean

# Install PIP
RUN wget https://raw.github.com/pypa/pip/master/contrib/get-pip.py && python get-pip.py

RUN mkdir /opt
ADD tchoupi /opt/tchoupi

# Nginx
ADD ./nginx/nginx.conf /etc/nginx/nginx.conf

# Supervisord
ADD ./supervisord/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# nginx
EXPOSE 80

CMD ["/usr/bin/supervisord"]
