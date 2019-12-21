FROM elixir:latest

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - && \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -qq -y build-essential nodejs yarn postgresql-client inotify-tools

WORKDIR /app
COPY . /app

RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix do compile
