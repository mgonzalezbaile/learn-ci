#!/bin/bash

set -ev
./scripts/build.sh
./scripts/run-php-tests.sh
./scripts/build-artifact.sh
./scripts/deploy-staging.sh
