#!/bin/bash

rm -rf /var/lib/mysql
docker-compose up -d --force-recreate
