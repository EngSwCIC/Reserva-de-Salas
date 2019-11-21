  Funcionalidade: resolver_conflitos_admin
  Como Administrador do Sistema
  Para que não existam conflitos de horário nas reservas
  Eu gostaria de ver as solicitações que possuem conflito de horário
  E poder escolher qual será aprovada

  Background: Comece como admin
  Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
  E que eu esteja logado
  E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-133 |
      |location| PJC-BT |


  #Happy path
  Cenario: Com conflito
  Dado que existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
  E que eu esteja na página "all-appointments"
  Quando eu clicar no botao "Visualizar Conflitos" 
  Então eu devo ver listados os dados de "ID> <appointment_id>", "ID> <appointment_id>"
  E eu devo ver link "Editar"
  Exemplos:
    | appointment_date | start_time | name    | location |
    | 2019-11-25       | 16:00:00   | Pat-133 | PJC-BT   |
    | 2019-11-25       | 16:00:00   | Pat-133 | PJC-BT   |

  #Sad path
  Cenario: Sem conflito
  Dado que existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
  E que eu esteja na página "all-appointments"
  Quando eu clicar no botão "Visualizar Conflitos"
  Então eu devo ver uma mensagem "Não existem conflitos."
  E não devo ver listados os dados de "ID> <appointment_id>", "ID> <appointment_id>"
  Exemplos:
    | appointment_date | start_time | name    | location |
    | 2019-11-25       | 16:00:00   | Pat-133 | PJC-BT   |
    | 2019-11-27       | 16:00:00   | Pat-133 | PJC-BT   |
