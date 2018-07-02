FROM ruby:2.3.3
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /reserva-de-salas
WORKDIR /reserva-de-salas
COPY Gemfile /reserva-de-salas/Gemfile
COPY Gemfile.lock /reserva-de-salas/Gemfile.lock
RUN bundle install
COPY . /reserva-de-salas