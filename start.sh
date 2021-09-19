#!/bin/sh

# Realiza as migrations no banco
bundle exec rails db:migrate

# Roda nosso servidor
bundle exec puma -C config/puma.rb
