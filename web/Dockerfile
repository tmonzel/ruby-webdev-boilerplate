FROM ruby:alpine
WORKDIR /usr/src/app
COPY Gemfile Gemfile.lock ./
RUN bundle install
COPY ./server.rb ./
EXPOSE 4567
CMD ruby server.rb