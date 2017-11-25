#!/bin/bash

set -ev

docker build -t my_php -f docker/php/Dockerfile .
docker build -t my_app -f docker/app/Dockerfile .
docker build -t my_nginx -f docker/nginx/Dockerfile .

docker run my_app curl -s http://getcomposer.org/installer | php
docker run my_app php composer.phar install
