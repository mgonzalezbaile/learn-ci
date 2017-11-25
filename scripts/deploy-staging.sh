#!/bin/bash

set -ev
printf "Deploy staging $ARTIFACT_NAME\n"

mkdir ~/.aws/
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID\n aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials

curl -L https://github.com/docker/machine/releases/download/v0.13.0/docker-machine-`uname -s`-`uname -m` >/tmp/docker-machine &&
chmod +x /tmp/docker-machine &&
sudo cp /tmp/docker-machine /usr/local/bin/docker-machine

docker-machine create \
  --driver generic \
  --generic-ip-address=ec2-54-219-128-169.us-west-1.compute.amazonaws.com \
  learn-ci

 eval $(docker-machine env learn-ci)

docker-machine ssh learn-ci docker run -d --name php mgonzalezbaile/my_app
docker-machine ssh learn-ci docker run -pd 80:80 --link="php" my_nginx
