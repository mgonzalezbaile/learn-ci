#!/bin/bash

set -ev
printf "Deploy staging $ARTIFACT_NAME\n"

mkdir ~/.aws/
echo "aws_access_key_id = $AWS_ACCESS_KEY_ID\n aws_secret_access_key=$AWS_SECRET_ACCESS_KEY" > ~/.aws/credentials

eval $(docker-machine env learn-ci)
