FROM ruby:2.6

RUN mkdir /app
WORKDIR   /app

COPY ./Gemfile      /app
COPY ./Gemfile.lock /app

ENV BUNDLE_PATH /tmp/bundle

RUN bundle

ENV RACK_ENV production
ENV DOCKER   1

COPY . /app

CMD ["bundle", "exec", "rackup"]