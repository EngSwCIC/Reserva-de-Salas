#language: pt
#encoding: utf-8

Funcionalidade: reservas_do_dia
  Como Administrador do Sistema
  Para que eu verificar as reservas do dia
  Eu quero poder ter um botão com opção de verificar as reservas do dia

  Cenario: Não há reservas para hoje
  Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
  E que esteja logado
  E que esteja na pagina "backoffice"
  E eu clicar no link "Reservas para hoje"
  Então eu devo ver somente a data de hoje