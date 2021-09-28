# language: pt

Funcionalidade: paginação do index de salas existentes
-  Como administrador, 
   Para que eu possa reduzir o número de queries no banco de dados e o consumo de memória da aplicação,
   Eu quero que o index de salas existentes tenha paginação, sendo exibidas N salas por página.

# ate N
Cenário de Fundo:
   Dado que o banco possui até N salas
   E que eu quero acessar a lista das salas

Cenário: A lista é exibida corretamente sem paginação (Happy Path)
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página de Lista de salas e todos os salas são exibidas
    
# mais de N
Cenário de Fundo:
   Dado que o banco possui mais de N salas
   E que eu quero acessar a lista das salas

Cenário: A lista é exibida corretamente com paginação (Happy Path)
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página 1 de Lista de salas 
   Quando eu clico em "Próxima página"
   Então eu devo estar na próxima página de Lista de salas
   E assim sucessivamente, até que todas as salas sejam exibidas

Cenário: A lista é exibida com paginação, mas são exibidas páginas vazias (Sad Path)
   Quando eu clico em "Ver Listas de Salas Existentes"
   Então eu devo estar na página 1 de Lista de salas 
   Quando eu clico em "Próxima página"
   Então eu devo estar na próxima página de Lista de salas
   Quando eu clico em "Próxima página", mas todas as salas já foram exibidas
   Então eu devo estar numa página vazia