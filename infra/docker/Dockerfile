FROM ubuntu

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && apt-get -y install python3 python3-pip nano iputils-ping python3-mysqldb
#apache2 libapache2-mod-wsgi-py3

COPY ./app /home/FlaskApp

RUN ls -l /home/FlaskApp

WORKDIR ./docker

COPY ./requirements .

RUN pip3 install -r requirements

ENTRYPOINT  FLASK_APP=/home/FlaskApp/main.py flask run --host=0.0.0.0