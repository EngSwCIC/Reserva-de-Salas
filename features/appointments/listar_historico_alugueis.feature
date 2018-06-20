#language: pt
#encoding: utf-8

Funcionalidade: listar_historico_alugueis
  Como Usuário autenticado
  Para que eu organize os status dos meus aluguéis
  Eu quero visualizá-los em um dashboard

  Cenário: Lista de Alugueis aparece adequadamente
    Dado que eu esteja logado como usuário comum com o email "xela@email.com" e a senha "123123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
    | name     | Pat-45 |
    | location | PAT-AT |
    E existam os seguintes alugueis cadastrados no meu nome:
    | appointment_date | start_time |
    | 22-06-2018 | 08:00:00 | 
    | 23-06-2018 | 10:00:00 |
    Quando eu clicar no botão "Ver Alugueis"
    Então eu devo estar em uma página que contenha a seguinte tabela:
    | Appointment Date | Start Time | 
    | 2018-06-22 | 08:00:00 |
    | 2018-06-23 | 10:00:00 |