# Reserva-de-Salas
<a href="https://zenhub.com"><img src="https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png"></a>

### Rodando a aplicação com Docker

1 - Clone o repositório utilizando o comando: ` git clone git@github.com:EngSwCIC/Reserva-de-Salas.git` ou `git clone https://github.com/EngSwCIC/Reserva-de-Salas.git` 

2 - Installe o docker: `sudo apt-get update && sudo apt-get install docker-ce`

3 - Instale o docker-compose: ``sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-\`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose``

Verifique a instalação com : `docker-compose --version`

4 - Builde o container no qual a aplicação rodará: `docker-compose build`
5 - Inicializa o container: `docker-compose up`
6 - Caso necessário, inicializa o banco: `docker-compose run web bundle exec rake db:create`
7 - Realize a migração: `docker-compose run web bundle exec rake db:migrate`