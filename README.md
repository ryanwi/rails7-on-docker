![Ruby](https://github.com/ryanwi/rails7-on-docker/workflows/Ruby/badge.svg)

# Rails 7 on Docker demo application

This app demonstrates Rails 7 with PostgreSQL, import maps, turbo, stimulus and hotwire, all running in Docker.

## Initial setup
```
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
docker compose run --rm web bundle exec rspec
```

## Updating gems
```
docker compose run --rm web bundle update
docker compose up --build
```

## Credits/References

### Rails with Docker
* https://docs.docker.com/compose/rails/
* https://pragprog.com/book/ridocker/docker-for-rails-developers
* https://evilmartians.com/chronicles/ruby-on-whales-docker-for-ruby-rails-development

### Rails 7 with importmaps
