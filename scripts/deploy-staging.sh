#!/bin/bash

set -ev
printf "Deploy staging $ARTIFACT_NAME\n"

docker tag my_app mgonzalezbaile/my_app
docker tag my_nginx mgonzalezbaile/my_nginx
docker push mgonzalezbaile/my_nginx
docker push mgonzalezbaile/my_app
