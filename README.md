[![CI](https://github.com/ryanwi/rails7-on-docker/actions/workflows/ci.yml/badge.svg)](https://github.com/ryanwi/rails7-on-docker/actions/workflows/ci.yml)
[![Docker](https://github.com/ryanwi/rails7-on-docker/actions/workflows/docker.yml/badge.svg)](https://github.com/ryanwi/rails7-on-docker/actions/workflows/docker.yml)

Start here: https://github.com/ryanwi/rails7-on-docker/generate

# Rails 7 on Docker demo application

This app demonstrates Rails 7 with PostgreSQL, import maps, turbo, stimulus and hotwire, all running in Docker.

**NOTE:** [There is also an example Rails 6 application working in Docker with Webpacker](https://github.com/ryanwi/rails-on-docker)

## Features

* Rails 7
* Ruby 3.3
* Dockerfile and Docker Compose configuration
* PostgreSQL database
* Redis
* GitHub Actions for 
  * tests
  * Rubocop for linting
  * Security checks with [Brakeman](https://github.com/presidentbeef/brakeman) and [bundler-audit](https://github.com/rubysec/bundler-audit)
  * Building and testing of a production Docker image
* Dependabot for automated updates

## Requirements

Please ensure you are using Docker Compose V2. This project relies on the `docker compose` command, not the previous `docker-compose` standalone program.

https://docs.docker.com/compose/#compose-v2-and-the-new-docker-compose-command

Check your docker compose version with:
```
% docker compose version
Docker Compose version v2.10.2
```

## Initial setup
```
cp .env.example .env
docker compose build
docker compose run --rm web bin/rails db:setup
```

## Running the Rails app
```
docker compose up
```

## Running the Rails console
When the app is already running with `docker-compose` up, attach to the container:
```
docker compose exec web bin/rails c
```

When no container running yet, start up a new one:
```
docker compose run --rm web bin/rails c
```

## Running tests
```
docker compose run --rm web bin/rspec
```

## Updating gems
```
docker compose run --rm web bundle update
docker compose up --build
```

## Production build

(adjust tags as needed)

### with [BuildKit](https://docs.docker.com/build/buildkit/)
```
DOCKER_BUILDKIT=1 docker build --tag rails-on-docker --load .
```

Test the image can be used and Rails starts up, use a fake key for testing purposes only:
```
docker run --rm --env SECRET_KEY_BASE=dummy rails-on-docker
```

### With legacy builder (no BuildKit)
```
docker build --tag rails-on-docker .
```

Test the image can be used and Rails starts up, use a fake key for testing purposes only:
```
docker run --rm --env SECRET_KEY_BASE=dummy rails-on-docker
```

## Deployment

This app can be hosted wherever Ruby is supported and PostgreSQL databases can be provisioned.

#### Render

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://render.com/deploy?repo=https://github.com/ryanwi/rails7-on-docker)

NOTE: You will need to generate a production secret with `bin/rails secret` and set it as the `SECRET_KEY_BASE` environment variable.

## Credits/References

### Rails with Docker
* [Quickstart: Compose and Rails](https://github.com/docker/awesome-compose/tree/master/official-documentation-samples/rails/)
* [Docker Rails Samples](https://docs.docker.com/samples/rails/)
* [Docker for Rails Developers
Build, Ship, and Run Your Applications Everywhere](https://pragprog.com/titles/ridocker/docker-for-rails-developers/)
* [Ruby on Whales:
Dockerizing Ruby and Rails development](https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development)
* [Rails generator to produce Dockerfiles and related files](https://github.com/rubys/dockerfile-rails)
* [docker init](https://docs.docker.com/engine/reference/commandline/init/)
* [Rails 7.1 Dockerfile Generator Template](https://github.com/rails/rails/blob/main/railties/lib/rails/generators/rails/app/templates/Dockerfile.tt)

### Rails 7 with importmaps 

* [Alpha preview: Modern JavaScript in Rails 7 without Webpack](https://www.youtube.com/watch?v=PtxZvFnL2i0)

### Rails 7 with hotwire

* [Stimulus 3 + Turbo 7 = Hotwire 1.0](https://world.hey.com/dhh/stimulus-3-turbo-7-hotwire-1-0-9d507133)
* [Turbo 7](https://world.hey.com/hotwired/turbo-7-0dd7a27f)
* [Rails 7 will have three great answers to JavaScript in 2021+](https://world.hey.com/dhh/rails-7-will-have-three-great-answers-to-javascript-in-2021-8d68191b)
* [Hotwire Turbo Replacing Rails UJS](https://www.driftingruby.com/episodes/hotwire-turbo-replacing-rails-ujs)

## Author

**Ryan Williams**

- <https://www.ryanwilliams.dev>
- <https://twitter.com/ryanwi>
- <https://hachyderm.io/@ryanwi>
- <https://github.com/ryanwi>
