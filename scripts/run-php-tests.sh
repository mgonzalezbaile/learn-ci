#!/bin/bash

set -ev
php bin/phpunit -c phpunit.xml.dist
php bin/phpunit --coverage-clover=coverage.clover
wget https://scrutinizer-ci.com/ocular.phar
php ocular.phar code-coverage:upload --format=php-clover coverage.clover
