FROM ubuntu:latest

ENV TZ=Europe/Paris
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update && apt-get -y install \
   python3 \
   python3-pip \
   python3-mysqldb \
   iputils-ping

COPY ./app /home/FlaskApp

RUN ls -l /home/FlaskApp

COPY ./requirements .

RUN pip3 install -r requirements

ENTRYPOINT  FLASK_APP=/home/FlaskApp/main.py flask run --host=0.0.0.0