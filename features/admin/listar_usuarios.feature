#language: pt
#encoding: utf-8

Funcionalidade: listar todos os usuarios do sistema
    Como Administrador do Sistema
    eu quero ver uma lista de todos os usuários do sistema
    e poder ordenar a listagem por ordem alfabética

    Contexto:
        Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
        E que eu esteja na pagina backoffice

    Esquema do Cenário: Listar todos os usuários
        E que exista um usuário com nome "<username>", curso "<course>", email "<email>", registro "<registration>"
        Quando eu clicar no link "Todos os usuários"
        Então eu devo ver uma tabela com os dados:
            | username     | <username>     |
            | course       | <course>       |
            | email        | <email>        |
            | registration | <registration> |
            Exemplos:
                | username | course                 | email              | registration |
                | João     | Ciência da Computação  | joao@gmail.com     | teste        |
                | Genesio  | Engenharia de Software | genesio1@gmail.com | 123123123    |
                | Arthur   | Engenharia de Software | genesio2@gmail.com | 123123123    |
                | Otavio   | Engenharia de Software | genesio3@gmail.com | 123123123    |
                | Danilo   | Engenharia de Software | genesio4@gmail.com | 123123123    |
                | Thiago   | Engenharia de Software | genesio5@gmail.com | 123123123    |

    Esquema do Cenário: Listar todos os usuários e ordenar por ordem alfabética
        E que exista um usuário com nome "<username>", curso "<course>", email "<email>", registro "<registration>"
        Quando eu clicar no link "Todos os usuários"
        E clicar na coluna "Nome"
        Então o primeiro usuario deve ser "admin" e o segundo "<username>"
        E clicar na coluna "Nome"
        Então o primeiro usuario deve ser "<username>" e o segundo "admin"

        Exemplos:
            | username | course                 | email              | registration |
            | João     | Ciência da Computação  | joao@gmail.com     | teste        |
            | Genesio  | Engenharia de Software | genesio1@gmail.com | 123123123    |
            | Arthur   | Engenharia de Software | genesio2@gmail.com | 123123123    |
            | Otavio   | Engenharia de Software | genesio3@gmail.com | 123123123    |
            | Danilo   | Engenharia de Software | genesio4@gmail.com | 123123123    |
            | Thiago   | Engenharia de Software | genesio5@gmail.com | 123123123    |

