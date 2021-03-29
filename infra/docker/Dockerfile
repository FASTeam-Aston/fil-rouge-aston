FROM ubuntu

RUN apt-get update && apt-get -y install python3 python3-pip nano iputils-ping python3-mysqldb

COPY ./Dev /home/adminsys/Flask_app

COPY ./infra/docker/requirements .

RUN pip3 install -r requirements

ENTRYPOINT  FLASK_APP=/home/adminsys/Flask_app/main.py \
            flask run --host=0.0.0.0