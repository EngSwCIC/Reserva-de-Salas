# language: pt
# encoding: utf-8

Funcionalidade: Propósito de uso da sala (aula, banca, palestra, outro(com campo de especificação)).
	Como usuário autenticado do sistema.
	Para que os administradores saibam a prioridade de uso da sala.
	Eu quero informar para qual o propósito irei usar a sala ao fazer uma reserva.
	
Cenario: O motivo da reseva da sala é salva no sistema com sucesso
	Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
	E eu esteja na página “reservar_sala”
	Existirá um campo de texto com o nome <motivo_reserva>
	Então eu digitarei no campo de motivo o motivo da reserva de sala
	Depois continuarei o processo de reserva de sala