#!/bin/bash

set -ev

docker build -t my_php -f docker/php/Dockerfile .
docker build -t my_nginx -f docker/nginx/Dockerfile .

docker run my_php curl -s http://getcomposer.org/installer | php
docker run -v $(pwd):/var/www/html my_php php composer.phar install

docker build -t my_app -f docker/app/Dockerfile .

#chown -r www-data:www-data $(pwd)
