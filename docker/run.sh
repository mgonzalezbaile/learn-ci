#!/bin/bash

docker run -ti --rm -u $UID:$UID -v $(pwd):/var/www/html docker_php $@
