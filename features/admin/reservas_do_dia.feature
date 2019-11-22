#language: pt
#encoding: utf-8

Funcionalidade: reservas_do_dia
  Como Administrador do Sistema
  Para que eu verificar as reservas do dia
  Eu quero poder ter um botão com opção de verificar as reservas do dia

  # Sad path
  Cenario: Não há reservas para hoje
  Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
  E que esteja logado
  E que esteja na pagina "backoffice"
  E eu clicar no link "Reservas para hoje"
  Então eu devo ver somente a data de hoje

  # Happy path
  Cenário: Há reservas para hoje
  Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
  E que esteja logado
  E que esteja na pagina "backoffice"
  E eu clicar no link "Adicionar Sala"
  Quando eu preencher o campo nome e localidade com:
  |room_name|foobar|
  |room_location|fooland|
  E clicar no botao "Criar Sala"
  Então eu devo ver uma mensagem "A sala foi criada com sucesso"
  Quando eu clicar no botao "Ver lista de salas existentes"
  Então eu devo estar em uma página com uma tabela com os dados:
    |name|foobar|
    |location|fooland|
  Quando eu clicar no link "Aluguel" próximo ao nome da sala
  E preencher o dia do aluguel com a data de hoje
      |appointment_date| Amanha |
  E selecionar o seguinte horário de "18:00 - 20:00" da noite
  E clicar no botão "Alugar"
  Então eu devo ver uma mensagem "Alguel realizado com sucesso!"
  Quando eu clicar no botão "Reservas para hoje"
  Então eu devo estar em uma página com uma tabela com os dados:
    |id|1|
    |nome|foobar|
    |usuario|admin|
    |inicio|18:00|
    |fim|20:00|
