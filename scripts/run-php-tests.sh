#!/bin/bash

set -ev
docker run -v $(pwd):/var/www/html my_app php vendor/phpunit/phpunit/phpunit -c phpunit.xml.dist
#docker run -v $(pwd):/var/www/html my_app php vendor/phpunit/phpunit/phpunit --coverage-clover=coverage.clover
#docker run -v $(pwd):/var/www/html my_app wget https://scrutinizer-ci.com/ocular.phar
#docker run -v $(pwd):/var/www/html my_app php ocular.phar code-coverage:upload --format=php-clover coverage.clover
