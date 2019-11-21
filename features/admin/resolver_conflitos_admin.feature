Funcionalidade: resolver_conflitos_admin
  Como Administrador do Sistema
  Para que não existam conflitos de horário nas reservas
  Eu gostaria de ver as solicitações que possuem conflito de horário
  E poder escolher qual será aprovada

  Background: Comece como admin
	Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
	E que eu esteja logado
	E existam as salas cadastradas no sistema "<name>", "<location>"

	#Happy path
  Cenario: com conflito
  Dado que eu adicionei aluguéis conflitantes-----
  E que eu esteja na página "all-appointments"
	Dado que eu clico no botao "Visualizar Conflitos" 
	Então eu devo ver listados os dados de "ID> <appointment_id>", "ID> <appointment_id>"
	E eu devo ver link "Editar"

	#Sad path
  Cenario: sem conflito
  Dado que eu adicionei aluguéis não conflitantes-----
  E que eu esteja na página "all-appointments"
	Dado que eu clico no botão "Visualizar Conflitos"
	Então eu devo ver uma mensagem escrita "Não existem conflitos."
	E não devo ver listados os dados de "ID> <appointment_id>", "ID> <appointment_id>"