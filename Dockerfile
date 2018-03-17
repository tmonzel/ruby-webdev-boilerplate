FROM ruby:2.5
WORKDIR /usr/src/app

RUN bundle config --global frozen 1

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

EXPOSE 4567

CMD ["ruby", "./server.rb"]