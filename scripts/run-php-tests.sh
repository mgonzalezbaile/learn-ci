#!/bin/bash

set -ev
docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html my_app php bin/phpunit -c phpunit.xml.dist
docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html my_app php bin/phpunit --coverage-clover=coverage.clover
docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html my_app wget https://scrutinizer-ci.com/ocular.phar
docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html my_app php ocular.phar code-coverage:upload --format=php-clover coverage.clover
