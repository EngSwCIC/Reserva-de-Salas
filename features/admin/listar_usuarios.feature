#language: pt
#encoding: utf-8

Funcionalidade: listar_usuarios
    Como Administrador do Sistema
    Para que eu possa ver uma lista de todos os usuários do sistema

    Esquema do Cenário: Listar todos os usuários
        Dado que eu esteja logado como administrador com o email "admin@admin.com" e a senha "admin123"
        E eu esteja no "backoffice"
        E existe um usuário com nome <username>, <course>, <email>, <registration> cadastrado no sistema
        Quando eu clicar no botão "Usuários"
        Então eu devo estar em uma página com uma tabela com os dados           
            | username | João   |
            | course | Ciência da Computação|
            | email | joao@gmail.com |
            | registration |teste|
        Exemplos:    
            | username | course | email | registration |
            | João | Ciência da Computação| joao@gmail.com |teste|