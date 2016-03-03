FROM ubuntu:14.04
MAINTAINER Alex E <alexe@mail.com>

RUN apt-get -y update
RUN easy_install pip
RUN apt-get -y install nginx python-pip python-dev uwsgi-plugin-python

RUN mkdir -p /var/log/nginx/dockerApp
RUN mkdir -p /var/log/uwsgi/dockerApp

USER root

RUN apt-get -y update

