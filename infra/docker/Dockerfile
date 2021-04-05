FROM ubuntu

RUN apt-get update && apt-get -y install python3 python3-pip nano iputils-ping python3-mysqldb apache2 libapache2-mod-wsgi-py3

WORKDIR ../Dev

COPY ./ /home/Flask_app

WORKDIR ../infra/docker/

COPY ./infra/docker/requirements .

RUN pip3 install -r requirements

ENTRYPOINT  FLASK_APP=/home/Flask_app/main.py \
            flask run --host=0.0.0.0