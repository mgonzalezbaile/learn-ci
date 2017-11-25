#!/bin/bash

set -ev
printf "Deploy staging $ARTIFACT_NAME\n"

mkdir ~/.aws/
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID\n aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials

curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

docker-machine create --driver amazonec2  --amazonec2-open-port 80 --amazonec2-region us-west-1 learn-ci
eval $(docker-machine env learn-ci)
docker run -d --name php mgonzalezbaile/my_app
docker run -pd 80:80 --link="php" my_nginx
