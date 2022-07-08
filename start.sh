#!/usr/bin/env bash
test=`docker-compose --version`
if [ -z "$test" ]; then echo "Please install docker compose";  exit; fi

if test -f ".env"; then
    echo ".env exists."
else
    cp .env.example .env
fi


cp .env.example .env
docker-compose build
docker-compose run --rm web bin/rails db:setup
docker-compose up
