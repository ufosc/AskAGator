FROM ruby:2.5.3-stretch

RUN apt-get update -qq && apt-get install -y build-essential libpq-dev curl
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - && apt-get install -y nodejs

RUN mkdir /myapp
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY . /myapp
