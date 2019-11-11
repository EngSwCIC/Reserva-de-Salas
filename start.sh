# Instala as Gems
bundle check || bundle install
# Realiza as migrations no banco
bundle exec rails db:migrate
# Compila os assets
# bundle exec rails assets:precompile
# Roda nosso servidor
bundle exec puma -C config/puma.rb
