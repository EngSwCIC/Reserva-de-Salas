# Reserva-de-Salas
<a href="https://zenhub.com"><img src="https://raw.githubusercontent.com/ZenHubIO/support/master/zenhub-badge.png"></a>

## Descrição

Este projeto consiste na criação de um sistema para reserva de salas para uma universidade, de modo a ser possível adaptá-lo para  

Para utiliza-lo é necessario fazer os seguintes passos:

### No Ubuntu:

1. Abra um terminal e digite `git clone https://github.com/EngSwCIC/Reserva-de-Salas.git`

#### Rodando a aplicação com Docker

1. Clone o repositório utilizando o comando: ` git clone git@github.com:EngSwCIC/Reserva-de-Salas.git` ou `git clone https://github.com/EngSwCIC/Reserva-de-Salas.git` 

2. Installe o docker: `sudo apt-get update && sudo apt-get install docker-ce`

3. Instale o docker-compose: ``sudo curl -L https://github.com/docker/compose/releases/download/1.18.0/docker-compose-`uname -s`-\`uname -m` -o /usr/local/bin/docker-compose && sudo chmod +x /usr/local/bin/docker-compose``

Verifique a instalação com : `docker-compose --version`

4. Builde o container no qual a aplicação rodará: `docker-compose build`

5. Inicializa o container: `docker-compose up`

6. Caso necessário, inicializa o banco: `docker-compose run web bundle exec rake db:create`

7. Realize a migração: `docker-compose run web bundle exec rake db:migrate`

### No Windows:

1. É necessário instalar os seguintes softwares (As versões especificadas são as versões atualizadas até pelo menos maio de 2019):
	- Ruby          - Versão 2.3.3
	- Rails         - Versão 5.1.6
	- Bundler       - Versão 1.17.3 
	- Gem           - Versão 3.0.3
	- Postgre SQL   - Versão 10.8 

2. Abra um terminal ou alguma interface de preferência para realizar a clonagem do repositório.

3. Direcione-se a um diretório no qual deseja-se trabalhar com o projeto.

4. No terminal digite `git clone https://github.com/EngSwCIC/Reserva-de-Salas.git`

5. Execute o comando bundle install para instalar todas as gemas listadas no arquivo Gemfile.
	*Caso algum problema ocorra ou falte algum software para a execução dos comandos necessários, procure instalar todas as dependências antes de prosseguir.*

6. Este tópido será atualizado em breve.