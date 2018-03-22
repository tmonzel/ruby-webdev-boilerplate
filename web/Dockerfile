FROM ruby:alpine AS build
LABEL maintainer="Thomas Monzel <tom.monzel@gmail.com>"

WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN apk update && apk add \
  build-base \
  mariadb-dev \
  && bundle install \
  && apk del build-base -r

COPY ./config.ru ./
EXPOSE 80
CMD rackup -p80 --host 0.0.0.0