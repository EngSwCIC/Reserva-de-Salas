#language: pt
#encoding: utf-8

Funcionalidade: Notificação por e-mail de mudança no status de reserva de sala
  Como usuário cadastrado do sistema
  Para que saiba quando o pedido de reserva mudar de status
  Eu quero receber um e-mail informando que houve alteração do status da reserva

  # Caso feliz
  Cenário: Administrador aprovou pedido de sala
    Dado que eu esteja logado como usuário comum com o email "andre@email.com" e a senha "senhaandre"
    E eu esteja no página principal com caminho "/"
    E existam as salas cadastradas no sistema: "<name>", "<location>"
    E existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
    Quando eu clicar no botão "Salas Existentes"
    E eu clicar no link "Aluguel" próximo ao nome da sala
    E preencher o dia do alugel com:
      |appointment_date| Amanha |
    E selecionar o seguinte horário de "10:00 - 12:00" da manhã
    E clicar no botão "Alugar"
    Então após o pedido ser analisado pelo administrador do sistema eu devo receber em meu email "Pedido de aluguel aprovado!"

  # Caso triste
  Cenário: Administrador reprovou pedido de sala
    Dado que eu esteja logado como usuário comum com o email "andre@email.com" e a senha "senhaandre"
    E eu esteja no página principal com caminho "/"
    E existam as salas cadastradas no sistema: "<name>", "<location>"
    E existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
    Quando eu clicar no botão "Salas Existentes"
    E eu clicar no link "Aluguel" próximo ao nome da sala
    E preencher o dia do alugel com:
      |appointment_date| Amanha |
    E selecionar o seguinte horário de "10:00 - 12:00" da manhã
    E clicar no botão "Alugar"
    Então após o pedido ser analisado pelo administrador do sistema eu devo receber em meu email "Pedido de aluguel recusado!"