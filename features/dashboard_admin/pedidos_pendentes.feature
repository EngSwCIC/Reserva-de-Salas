#language: pt
#encoding: utf-8

Funcionalidade: Quantidade de pedidos pendentes
Eu como administrador
Quero poder ver a quantidade de pedidos pendentes
Para poder aceitar ou recusar um pedido.

    Contexto:
    Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
    E que esteja logado
    E que esteja na página “backoffice”
    E eu clicar no link "Mostrar os Pedidos Pendentes"

    Cenário: Listar Pedidos Pendentes.
        Quando eu clicar em "Mostrar os Pedidos Pendentes".
        Então eu devo ver uma tabela com todas as salas e horários reservados:
        |#número de reservas|Localização|Sala|Data|Horário da reserva|Usuário|Capacidade|Editar|
        | Quantidade |<room_location>|<room_name>|<appointment_date>|<time>|<username>|<edit>|
        E quando clicar na sala reservada se direcionar para o link de horários da sala
        E quando eu clicar no usuário ser direcionado para o link do perfil do usuário
        E quando eu clicar em editar, poder aceitar ou recusar a reserva..

    #Caminho Feliz
    Cenário: Ver os pedidos pendentes.
        Quando eu clicar em "Mostrar os pedidos pendentes" no dashboard do administrador.
        Então eu devo ver uma lista com determinadas quantidades de reservas de salas pendentes a serem aceitas ou recusadas.
        E eu devo ver uma tabela com várias reservas e vários horários reservados, por número de reserva, sala, data, horário da reserva e usuário.

    #Caminho Triste
    Cenário: Verificar quantos pedidos estão pendentes quando não há pedidos.
        Quando eu clicar em “Mostrar os Pedidos Pendentes” no dashboard do administrador
        Então eu permaneço no dashboard do administrador
        E deve aparecer um alerta de nenhum pedido pendente.