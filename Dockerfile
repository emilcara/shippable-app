
# Set the base image to Ubuntu
FROM ubuntu:14.04

#File author/maintainer
MAINTAINER Dockerfiles

# Update the source list
RUN apt-get update -y

# Install basic applications
RUN apt-get install -y build-essential git
RUN apt-get install -y python python-dev python-setuptools
RUN apt-get install -y nginx supervisor
RUN easy_install pip

# install uswsgi
RUN pip install uwsgi

# install nginx
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get update

# Copy the application folder inside the container
ADD /shippable-app /shippable-app

RUN pip install -r /shippable-app/requirements.txt

# setup all the configfiles
#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
#RUN rm /etc/nginx/sites-enabled/default
#RUN ln -s /home/shippable/nginx-app.conf /etc/nginx/sites-enabled/
#RUN ln -s /ome/shippable-app/supervisor-app.conf /etc/supervisor/conf.d/


#copy app folder to the container
#ADD requirements.txt /shippable-app/requirements.txt
#RUN cd /shippable-app; pip install -r requirements.txt

#ADD . /shippable-app

# setup and configuration
# run echo "daemon off;" >> /etc/nginx/nginx.conf
# run rm /etc/nginx/sites-enabled/default
# run ln -s /shippable-app/nginx-app.conf /etc/nginx/sites-enabled/
# run ln -s /supervisor-app.conf /etc/supervisor/conf.d/

# set default dir where CMD will run
WORKDIR /shippable-app

# Expose ports
EXPOSE 80

# set the default dir will command will execute
# when creating a new container
CMD ["python", "/shippable-app/wsgi.py"]
#CMD ["supervisord", "-n"]
