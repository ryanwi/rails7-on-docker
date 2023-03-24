FROM ruby:3.2.1-slim

RUN apt-get update -qq && apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    less \
    git \
    libpq-dev \
    postgresql-client \
    libvips \
    curl \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# RUN curl -fsSL https://deb.nodesource.com/setup_19.x | sudo -E bash - \
#     && apt-get install -y nodejs

ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3
  
RUN gem update --system && gem install bundler

WORKDIR /usr/src/app

ENTRYPOINT ["./bin/docker-entrypoint.sh"]

EXPOSE 3000
HEALTHCHECK --interval=10s --retries=10 --start-period=20s --timeout=10s \
  CMD curl --fail http://localhost:3000/health || exit 1

CMD ["bin/rails", "s", "-p", "3000", "-b", "0.0.0.0"]
