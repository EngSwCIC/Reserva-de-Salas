#language: pt
#encoding: utf-8

Funcionalidade: Notificação por e-mail de mudança no status de reserva de sala
  Como usuário cadastrado do sistema
  Para que saiba quando o pedido de reserva mudar de status
  Eu quero receber um e-mail informando que houve alteração do status da reserva

  # Caso feliz
  Cenário: Administrador aprovou pedido de sala
    Dado que eu esteja logado como usuário com o email "andre@email.com" e a senha "senhaandre"
    E eu esteja no página principal do sistema com caminho "/"
    E existam tais salas cadastradas no sistema: "<name>", "<location>"
    Quando eu selecionar a opção "Salas Existentes"
    E eu selecionar o botão "Tipos de Sala" 
    E eu preencher com o valor "Todas as Salas"
    E eu selecionar o link "Aluguel"
    E depois preencher o dia do aluguel com:
      |appointment_date| Amanha |
    E selecionar tal horário de "10:00 - 12:00" da manhã
    E eu selecionar o botão "Alugar"
    Então após o pedido ser analisado pelo administrador do sistema eu devo receber em meu email "Pedido de aluguel aprovado!"

  # Caso triste
  Cenário: Administrador reprovou pedido de sala
    Dado que eu esteja logado como usuário com o email "andre@email.com" e a senha "senhaandre"
    E eu esteja no página principal do sistema com caminho "/"
    E existam tais salas cadastradas no sistema: "<name>", "<location>"
    Quando eu selecionar a opção "Salas Existentes"
    E eu selecionar o botão "Tipos de Sala" 
    E eu preencher com o valor "Todas as Salas"
    E eu selecionar o link "Aluguel"
    E depois preencher o dia do aluguel com:
      |appointment_date| Amanha |
    E selecionar tal horário de "10:00 - 12:00" da manhã
    E eu selecionar o botão "Alugar"
    Então após o pedido ser analisado pelo administrador do sistema eu devo receber em meu email "Pedido de aluguel recusado!"