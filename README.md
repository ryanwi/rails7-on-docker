![Ruby](https://github.com/ryanwi/rails7-on-docker/workflows/Ruby/badge.svg)

# Rails 7 on Docker ** MYSQL ** demo application

This app demonstrates Rails 7 with Mysql8, import maps, turbo, stimulus and hotwire, all running in Docker.

## Features

* Mysql 8
* Rails 7
* Ruby 3
* Dockerfile and Docker Compose configuration
* MYSQL database
* Redis
* GitHub Actions for 
  * tests
  * Rubocop for linting
  * Security checks with [Brakeman](https://github.com/presidentbeef/brakeman) and [bundler-audit](https://github.com/rubysec/bundler-audit)
* Dependabot for automated updates

## Running the Rails app
```
sh start.sh 
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
docker-compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker-compose run --rm web bin/rails c
```

## Running tests
```
docker-compose run --rm web bin/rspec
```

## Updating gems
```
docker-compose run --rm web bundle update
docker-compose up --build
```

## Credits/References
Thanks!! to ryanwi for the postgres version 

https://github.com/ryanwi/rails7-on-docker

