#language: pt
#encoding: utf-8

@wip
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
        | Quantidade |<room_location>|<room_name>|<appointment_date>|<time>|<username>|<capacity>|<edit>|
        E quando eu clicar em editar, 
        Entao poder aceitar ou recusar a reserva..

    #Caminho Triste
    Cenário: Verificar quantos pedidos estão pendentes quando não há pedidos.
        Quando eu clicar em “Mostrar os Pedidos Pendentes” no dashboard do administrador
        Então eu permaneço no dashboard do administrador
        E deve aparecer um alerta de nenhum pedido pendente.