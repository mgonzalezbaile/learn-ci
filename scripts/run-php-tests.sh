#!/bin/bash

set -ev
docker run my_app php bin/phpunit -c phpunit.xml.dist
docker run my_app php bin/phpunit --coverage-clover=coverage.clover
docker run my_app wget https://scrutinizer-ci.com/ocular.phar
docker run my_app php ocular.phar code-coverage:upload --format=php-clover coverage.clover
