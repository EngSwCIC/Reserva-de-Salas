# language: pt
# encoding: utf-8

Funcionalidade: resolver_conflitos_admin
  Como Administrador do Sistema
  Para que não existam conflitos de horário nas reservas
  Eu gostaria de ver as solicitações que possuem conflito de horário
  E poder escolher qual será aprovada

  Contexto: Comece como admin
  Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
  E que eu esteja logado
  E existam as seguintes salas cadastradas no sistema:
      |name_room  | Pat-133 |
      |location| PJC-BT |


  #Happy path
  Esquema do Cenario: Com conflito
  Dado que existem os seguintes alugueis: "<appointment_date>", "<start_time>"
  E que eu esteja na página "all-appointments"
  Quando eu clicar no botao "Visualizar Conflitos" 
  Então eu devo ver listados os dados de "ID>", "<appointment_date>", "<start_time>"
  E eu devo ver link "Editar"
  Exemplos:
    | appointment_date | start_time | name    | location |
    | 2019-11-25       | 16:00:00   | Pat-133 | PJC-BT   |
    | 2019-11-25       | 16:00:00   | Pat-133 | PJC-BT   |

  #Sad path
  Esquema do Cenario: Sem conflito
  Dado que existem os seguintes alugueis: "<appointment_date>", "<start_time>"
  E que eu esteja na página "all-appointments"
  Quando eu clicar no botão "Visualizar Conflitos"
  Então eu devo ver uma mensagem "Não existem conflitos."
  E não devo ver listados os dados de "ID>", "<appointment_date>", "<start_time>"
  Exemplos:
    | appointment_date | start_time | name    | location |
    | 2019-11-25       | 16:00:00   | Pat-133 | PJC-BT   |
    | 2019-11-27       | 16:00:00   | Pat-133 | PJC-BT   |
