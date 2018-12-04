# language: pt
# encoding: utf-8

Funcionalidade: Filtro de sala por salas ocupadas.
	Como administrador autenticado do sistema.
	Para melhor gerenciar o controle das salas a serem ocupadas.
	Eu quero poder filtrar a busca de salas mostrando todas as salas ocupadas na semana.

	Cenario: Lista de salas ocupadas aparece adequadamente

		Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
		E que esteja logado
		E existam as seguintes salas cadastradas no sistema:
			|name  	 | Pjc-54 |
			|location| PJC-BT |
		E existam alugueis para a semana cadastrados no sistema na sala "Pjc-54", "PJC-BT"
		E eu clicar no link "Todos aluguéis"
		E eu esteja no página principal com caminho "/all-appointments"
		E eu clicar no link "Reservas da semana"
		E eu esteja no página principal com caminho "/weeks-appointments"
		Então eu devo estar em uma página contendo a lista com a reserva da sala na semana