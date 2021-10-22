# language: pt
# paginacao salas feature

Funcionalidade: paginação do index de salas existentes
-  Como administrador, 
   Para que eu possa reduzir o número de queries no banco de dados e o consumo de memória da aplicação,
   Eu quero que o index de salas existentes tenha paginação, sendo exibidas N salas por página.

Contexto:
   Dado que eu esteja logado como administrador
   E que eu esteja na página principal

Cenário: A lista é exibida corretamente com 1 página (Happy Path)
   Dado que o banco possui até 5 salas
   Quando eu clico em "Ver lista de salas existentes"
   Então eu devo estar na página "/rooms"

Cenário: A lista é exibida corretamente com paginação (Happy Path)
   Dado que o banco possui até 10 salas
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página "/rooms" 
   Dado que a página "2" existe
   Quando eu clico em página "2"
   Então eu devo estar na página "2"

Cenário: Eu tento acessar uma página que não existe (Sad Path)
   Dado que o banco possui até 10 salas
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página "1"
   Quando eu clico em "next"
   Então eu devo estar na página "2"
   Quando eu tento acessar a página "3"
   Então devo receber um erro