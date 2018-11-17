# language: pt
# encoding: utf-8

Funcionalidade: Filtro de sala por salas ocupadas. 
	Como administrador autenticado do sistema.
	Para melhor gerenciar o controle das salas a serem ocupadas.
	Eu quero poder filtrar a busca de salas mostrando todas as salas ocupadas na semana.
	
	Cenario: Lista de salas ocupadas aparece adequadamente

	Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
	E que esteja logado
	E eu clicar no link "Todos aluguéis"
	E eu esteja no página principal com caminho "/all-appointments"
	E existam as seguintes salas cadastradas no sistema:
		|name  	 	 | Pjc-54 |
		|location	 | PJC-BT |
		|name		 | Pat-45 |
		|location	 | PAT-AT |
	E exista o seguinte aluguel cadastrado no sistema:
		|appointment_date  | Amanha		     |
		|start_time 	   | 08:00:00 	     |
		|name   		   | Pjc-54 		 |
		|location 		   | PJC-BT  		 |
		|appointment_date  | Ontem  	     |
		|start_time 	   | 10:00:00 	     |
		|name   		   | Pat-45 		 |
		|location 		   | PAT-AT  		 |
	E eu clicar no link "Reservas da semana"
	Então eu esteja no página principal com caminho "/weeks-appointments"
	E eu devo estar em uma página com uma tabela com os dados:
		|start_time 	   | 08:00:00 	     |
		|name   		   | Pjc-54 		 |
		|location 		   | PJC-BT  		 |
		|start_time 	   | 10:00:00 	     |
		|name   		   | Pat-45 		 |
		|location 		   | PAT-AT  		 |