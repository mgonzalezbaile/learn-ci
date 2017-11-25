#!/bin/bash

set -ev
printf "Create the artifact for commit $ARTIFACT_NAME\n"

docker tag my_app mgonzalezbaile/my_app
docker tag my_nginx mgonzalezbaile/my_nginx

docker login -p $DOCKERHUB_PASSWORD -u $DOCKERHUB_USER

docker push mgonzalezbaile/my_nginx
docker push mgonzalezbaile/my_app

