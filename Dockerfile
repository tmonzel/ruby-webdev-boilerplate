FROM ruby:alpine
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY ./server.rb ./
CMD ruby server.rb