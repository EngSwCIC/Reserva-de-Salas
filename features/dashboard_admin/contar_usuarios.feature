#language: pt
#encoding: utf-8

Funcionalidade: contar todos os usuarios do sistema
    Como Administrador do Sistema
    eu quero ver a contagem de todos os usuários do sistema

    Contexto:
        Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
        E que eu esteja na pagina backoffice

        Cenário: Contar todos os usuários
            E que existam vários usuário no sistema
            Quando eu entrar no dashboard de admin
            Então eu devo ver a contagem de todos os usuários

        Cenário: Contagem de usuários quando não tiver usuários
            E que não tenha nenhum usuário no sistema
            Quando eu entrar no dashboard de admin
            Então nenhum usuário deve ser mostrado
