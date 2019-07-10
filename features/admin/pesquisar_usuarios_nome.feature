#language: pt
#encoding: utf-8

Funcionalidade: pesquisar usuários de uma tabela pelo nome
    Como administrador do sistema, quero poder pesquisar os
    usuários do sistema pelo nome

    Contexto:
        Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
        E eu esteja na página de Lista de usuários

    Cenário: pesquisar usuário através do nome
    Dado que exista um usuário com nome "João", curso "Matemática", email "joao@gmail.com", registro "130123456"
        Quando eu escrever no campo "q[username_or_course_or_registration_cont]" o nome "João"
        E clicar no botão de busca "Search"
        Então eu devo ver uma tabela com o nome "João" e seus respectivos dados:
            | username     | João           |
            | course       | Matemática     |
            | email        | joao@gmail.com |
            | registration | 130123456      |
        E não devo ver o usuário "admin"

    Cenário: pesquisar o nome de um usuário não cadastrado
        Dado que exista um usuário com nome "João", curso "Matemática", email "joao@gmail.com", registro "130123456"
        Quando eu escrever no campo "q[username_or_course_or_registration_cont]" o nome "Genesio"
        E clicar no botão de busca "Search"
        Então não deve haver resultados da busca
