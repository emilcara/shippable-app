
# Set the base image to Ubuntu
FROM ubuntu:14.04

#File author/maintainer
MAINTAINER Alex E <alexe@mail.com>

# Update the source list
RUN apt-get update -y

# Install basic applications
RUN apt-get install -y python python-dev python-setuptools nginx python-pip build-essential
#RUN pip install uwsgi flask
RUN easy_install pip

#copy app folder to the container
ADD requirements.txt /shippable-app/requirements.txt

RUN cd /shippable-app; pip install -r requirements.txt

ADD . /shippable-app

# setup and configuration
# run echo "daemon off;" >> /etc/nginx/nginx.conf
# run rm /etc/nginx/sites-enabled/default
# run ln -s /shippable-app/nginx-app.conf /etc/nginx/sites-enabled/
# run ln -s /supervisor-app.conf /etc/supervisor/conf.d/

# Expose ports
EXPOSE 5000

# set the default dir will command will execute
# when creating a new container
CMD ["python", "/shippable-app/app.py"]
