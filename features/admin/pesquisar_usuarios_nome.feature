#language: pt
#encoding: utf-8

Funcionalidade: pesquisar usuários de uma tabela pelo nome
    Como administrador do sistema, quero poder pesquisar os
    usuários do sistema pelo nome

    Esquema do Cenário: pesquisar usuário através do nome
    
        Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
        E eu esteja na página de "backoffice"
        E e exista um usuário com <username>, curso <course>, email <email>, registro <registration>
        Quando eu escrever na barra de pesquisa o nome "João" e clicar no botão "Search"
        Então eu devo ver uma tabela com o nome "João" e seus respectivos dados:           
            | username | João   |
            | course | Matemática|
            | email | joao@gmail.com |
            | registration |130123456|

        Exemplos:    
            | username | course | email | registration |
            | João | Matemática| joao@gmail.com |130123456|