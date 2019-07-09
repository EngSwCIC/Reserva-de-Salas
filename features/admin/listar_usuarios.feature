#language: pt
#encoding: utf-8

Funcionalidade: listar todos os usuarios do sistema
    Como Administrador do Sistema
    eu quero ver uma lista de todos os usuários do sistema

    Esquema do Cenário: Listar todos os usuários
    
        Dado que eu seja admin do sistema com email "admin@admin.com" e senha "admin123"
        E e esteja na página de "backoffice"
        E existe um usuário com nome <username>, curso <course>, email <email>, registro <registration>
        Quando eu clicar no link "Todos os usuários"
        Então eu devo ver uma tabela com os dados:           
            | username | João   |
            | course | Ciência da Computação|
            | email | joao@gmail.com |
            | registration |teste|

        Exemplos:    
            | username | course | email | registration |
            | João | Ciência da Computação| joao@gmail.com |teste|