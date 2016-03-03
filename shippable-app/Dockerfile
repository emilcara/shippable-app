
# Set the base image to Ubuntu
FROM ubuntu:14.04

#File author/maintainer
MAINTAINER Alex E <alexe@mail.com>

# Update the source list
RUN apt-get -y update

# Install basic applications
RUN apt-get -y install python python-dev python-setuptools nginx python-pip build-essential
RUN pip install uwsgi flask

#copy app folder to the container
ADD . /shippable-app/

RUN pip install -r /shippable-app/requirements.txt

# setup and configuration
#run echo "daemon off;" >> /etc/nginx/nginx.conf
#run rm /etc/nginx/sites-enabled/default
#run ln -s /shippable-app/nginx-app.conf /etc/nginx/sites-enabled/
#run ln -s /supervisor-app.conf /etc/supervisor/conf.d/

RUN pip install -r /shippable-app/requirements.txt


# Expose ports
EXPOSE 80

# set the default dir will command will execute
# when creating a new container
CMD python app.py
