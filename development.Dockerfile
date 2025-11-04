# syntax = docker/dockerfile:1

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version and Gemfile
ARG RUBY_VERSION=3.3.9
ARG NODE_VERSION=22.12.0
FROM docker.io/library/ruby:$RUBY_VERSION-slim as base

# OS Level Dependencies
RUN --mount=type=cache,target=/var/cache/apt \
  --mount=type=cache,target=/var/lib/apt,sharing=locked \
  --mount=type=tmpfs,target=/var/log \
  rm -f /etc/apt/apt.conf.d/docker-clean; \
  echo 'Binary::apt::APT::Keep-Downloaded-Packages "true";' > /etc/apt/apt.conf.d/keep-cache; \
  apt-get update -qq \
  && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    curl \
    libjemalloc2 \
    pkg-config \
    libyaml-dev

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Install Node.js
ARG NODE_VERSION
RUN curl -sL https://github.com/nodenv/node-build/archive/master.tar.gz | tar xz -C /tmp/ && \
    /tmp/node-build-master/bin/node-build "${NODE_VERSION}" /usr/local/node && \
    rm -rf /tmp/node-build-master

ENV PATH=/usr/local/node/bin:$PATH

# Enable corepack for yarn/pnpm
RUN corepack enable

WORKDIR /usr/src/app

ENTRYPOINT ["./bin/docker-entrypoint-development"]

EXPOSE 3000

CMD ["./bin/rails", "server"]
