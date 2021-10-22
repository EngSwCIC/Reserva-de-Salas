# language: pt
# paginacao salas feature

Funcionalidade: paginação do index de salas existentes
-  Como administrador, 
   Para que eu possa reduzir o número de queries no banco de dados e o consumo de memória da aplicação,
   Eu quero que o index de salas existentes tenha paginação, sendo exibidas N salas por página.

Contexto:
   Dado que eu esteja logado como administrador com o email "admin@admin.admin" e a senha "adminseed"
   E que eu esteja logado
   E que eu quero acessar a lista das salas existentes

Cenário de Fundo:
   Dado que o banco possui até 5 salas

Cenário: A lista é exibida corretamente com 1 página (Happy Path)
   Quando eu clico em "Ver lista de salas existentes"
   Então eu devo estar na página "/rooms"
    
Cenário de Fundo:
   Dado que o banco possui até 10 salas

Cenário: A lista é exibida corretamente com paginação (Happy Path)
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página "/rooms" de Lista de salas 
   Dado que a página 2 existe
   Quando eu clico em página 2
   Então eu devo estar na página 2 de Lista de salas

Cenário: A lista é exibida com paginação, mas são exibidas páginas vazias (Sad Path)
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página 1 de Lista de salas 
   Quando eu clico em "Próxima página"
   Então eu devo estar na próxima página de Lista de salas
   Quando eu clico em "Próxima página"
   E todas as salas já foram exibidas
   Então eu devo estar numa página vazia