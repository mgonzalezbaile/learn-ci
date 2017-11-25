#!/bin/bash

set -ev

docker build -t my_nginx -f docker/nginx/Dockerfile .

docker build -t my_app -f docker/app/Dockerfile .

docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html my_app curl -s http://getcomposer.org/installer | php

docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html my_app php composer.phar install
