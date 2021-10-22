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
            | username | course                 | email            | registration |
            | Yan      | Ciência da Computação  | yan@gmail.com    | teste        |
            | Davi     | Engenharia de Software | davi@gmail.com   | 123123123    |
            | Sergio   | Engenharia de Software | sergio@gmail.com | 123123123    |

        Esquema do Cenário: Listar todos os usuários e ordenar por ordem alfabética
            E que exista um usuário com nome "<username>", curso "<course>", email "<email>", registro "<registration>"
            Quando eu clicar no link "Todos os usuários"
            E clicar na coluna "Nome"
            Então o primeiro usuario deve ser "admin" e o segundo "<username>"
            E clicar na coluna "Nome"
            Então o primeiro usuario deve ser "<username>" e o segundo "admin"

            Exemplos:
            | username | course                 | email            | registration |
            | Davi     | Ciência da Computação  | davi@gmail.com   | teste        |
            | Sergio   | Engenharia de Software | sergio@gmail.com | 123123123    |
            | Yan      | Engenharia de Software | yan@gmail.com    | 123123123    |

        Esquema do Cenário: Listar usuários quando não tiver usuários
            E que não tiver nenhum usuário no sistema
            Quando eu clicar no link "Todos os usuários"
            Então nenhum usuário deve ser mostrado

            Exemplos:
            | username | course | email | registration |

