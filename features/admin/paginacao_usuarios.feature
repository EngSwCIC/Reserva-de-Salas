# language: pt

Funcionalidade: paginação do index do usuário
-   Como administrador, 
    Para que eu possa reduzir o número de queries no banco de dados e o consumo de memória da aplicação,
    Eu quero que o index de usuários tenha paginação, sendo exibidos N usuários por página.

# ate N
Cenário de Fundo:
    Dado que o banco possui até N usuários
    E que eu quero acessar a lista dos usuários

Cenário: A lista é exibida corretamente sem paginação (Happy Path)
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página de Lista de Usuários e todos os usuários são exibidos
    
# mais de N
Cenário de Fundo:
    Dado que o banco possui mais de N usuários
    E que eu quero acessar a lista dos usuários

Cenário: A lista é exibida corretamente com paginação (Happy Path)
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página 1 de Lista de Usuários 
    Quando eu clico em "Próxima página"
    Então eu devo estar na próxima página de Lista de Usuários
    E assim sucessivamente, até que todos os usuários sejam exibidos

Cenário: A lista é exibida com paginação, mas são exibidas páginas vazias (Sad Path)
    Quando eu clico em "Todos os Usuários"
    Então eu devo estar na página 1 de Lista de Usuários 
    Quando eu clico em "Próxima página"
    Então eu devo estar na próxima página de Lista de Usuários
    Quando eu clico em "Próxima página" mas todos os usuários já foram exibidos
    Então eu devo estar numa página vazia
