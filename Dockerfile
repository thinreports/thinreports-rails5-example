FROM ruby:2.3.1

RUN apt-get update -qq && apt-get install -y build-essential && rm -rf /var/lib/apt/lists/*
RUN apt-get update -qq && apt-get install -y nodejs --no-install-recommends && rm -rf /var/lib/apt/lists/*

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
ADD . /myapp

EXPOSE 3000
