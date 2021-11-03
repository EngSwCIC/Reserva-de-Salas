# language: pt
# paginacao usuarios feature

Funcionalidade: paginação do index do usuário
-   Como administrador, 
    Para que eu possa reduzir o número de queries no banco de dados e o consumo de memória da aplicação,
    Eu quero que o index de usuários tenha paginação, sendo exibidos N usuários por página.

Contexto:
   Dado que eu esteja logado como administrador
   E que eu esteja na página principal

Cenário: A lista é exibida corretamente com 1 página (Happy Path)
   Dado que o banco possui até 5 usuários
   Quando eu clico em "Todos os Usuários"
   Então eu devo estar na página "/users/show"
    
Cenário: A lista é exibida corretamente com paginação (Happy Path)
   Dado que o banco possui até 10 usuários
   Quando eu clico em "Todos os Usuários"
   Então eu devo estar na página "/users/show" 
   Dado que a página "2" existe
   Quando eu clico em página "2"
   Então eu devo estar na página "2"

Cenário: Tento acessar uma página que não existe (Sad Path)
    Dado que o banco possui até 10 usuários
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página "1"
    Quando eu clico em "next"
    Então eu devo estar na página "2"
    Quando eu tento acessar a página "3"
    Então devo receber um erro
