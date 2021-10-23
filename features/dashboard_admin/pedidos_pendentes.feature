    #language: pt
    #encoding: utf-8


    Funcionalidade: Quantidade de pedidos pendentes
    Eu como administrador
    Quero poder ver a quantidade de pedidos pendentes
    Para poder aceitar ou recusar um pedido.

    Contexto:
    Dado que eu sou o administrador do sistema com email "admin@admin.com" senha "admin123"
    E que eu esteja na pagina backoffice

    #Caminho Feliz
    Cenário: Ver 1 pedidos pendentes.
    Dado que o usuário já tenha feito um pedido de sala
    E que eu esteja na pagina backoffice
    Entao eu devo ver a quantidade de pedidos pendentes
    
    #Caminho Triste
    Cenário: Verificar quantos pedidos estão pendentes quando não há pedidos.
    E que eu esteja na pagina backoffice
    Entao eu devo ver nenhum numero de pedidos pendentes

