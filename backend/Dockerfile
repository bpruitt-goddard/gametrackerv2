FROM ruby:2.6

WORKDIR /app/backend

COPY Gemfile ./
COPY Gemfile.lock ./

RUN gem install bundler
RUN bundle install

CMD ["rackup"]