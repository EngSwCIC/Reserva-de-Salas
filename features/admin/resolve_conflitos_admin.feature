Funcionalidade: visualizar_conflitos
  Como Administrador do Sistema
  Para que não existam conflitos de horário nas reservas
  Eu gostaria de ver as solicitações que possuem conflito de horário
  E escolher qual será aprovada

  Background: Comece como admin
	Dado que eu esteja cadastrado como "admin@admin.admin"
	E que eu esteja logado

	#Happy path
  Cenario: nome_cenario
  Dado que eu adicionei aluguéis conflitantes
  E que eu esteja na página "all-appointments"
	Então eu devo ver "Conflicts"
	Dado que eu clico no botão
	Então eu devo ver alugueis listados
	E eu devo ver botoes de editar

	#Sad path
  Cenario: nome_cenario
  Dado que eu adicionei aluguéis não conflitantes
  E que eu esteja na página "all-appointments"
	Então eu devo ver "Conflicts"
	Dado que eu clico no botão
	Não deve aparecer alugueis