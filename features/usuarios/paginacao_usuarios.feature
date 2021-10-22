# language: pt
# paginacao usuarios feature

Funcionalidade: paginação do index do usuário
-   Como administrador, 
    Para que eu possa reduzir o número de queries no banco de dados e o consumo de memória da aplicação,
    Eu quero que o index de usuários tenha paginação, sendo exibidos N usuários por página.

Contexto:
   Dado que eu esteja logado como administrador com o email "admin@admin.admin" e a senha "adminseed"
   E que eu esteja logado
   E que eu quero acessar a lista dos usuarios existentes

Cenário de Fundo:
    Dado que o banco possui até 5 usuários

Cenário: A lista é exibida corretamente com 1 página (Happy Path)
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página "/users/show"
    
Cenário de Fundo:
    Dado que o banco possui até 10 usuários

Cenário: A lista é exibida corretamente com 2 páginas (Happy Path)
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página "/users/show" de Lista de salas 
    Dado que a página 2 existe
    Quando eu clico em página 2
    Então eu devo estar na página 2 de Lista de Usuários

Cenário: A lista é exibida com paginação, mas são exibidas páginas vazias (Sad Path)
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página 1 de Lista de Usuários 
    Quando eu clico em "Próxima página"
    Então eu devo estar na próxima página de Lista de Usuários
    Quando eu clico em "Próxima página" mas todos os usuários já foram exibidos
    Então eu devo estar numa página vazia
