#!/bin/bash

set -ev

sudo docker build -t my_nginx -f docker/nginx/Dockerfile .
sudo docker build -t my_app -f docker/app/Dockerfile .

sudo docker run --name php my_app curl -s http://getcomposer.org/installer | php
sudo docker run --name php my_app php composer.phar install
