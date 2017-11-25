#!/bin/bash

set -ev

docker build -t my_nginx -f docker/nginx/Dockerfile .
docker build -t my_app -f docker/app/Dockerfile .

docker run --name php my_app curl -s http://getcomposer.org/installer | php
docker run --name php my_app php composer.phar install
