FROM ruby:2.3.1

# build-essential: C/C++コンパイラ、Make等の標準開発ツールなど一式が入ったUbuntuパッケージ
RUN apt-get update -qq && apt-get install -y build-essential

RUN mkdir /myapp
WORKDIR /myapp

ADD Gemfile /myapp/Gemfile
ADD Gemfile.lock /myapp/Gemfile.lock

RUN bundle install
ADD . /myapp

EXPOSE 3000
