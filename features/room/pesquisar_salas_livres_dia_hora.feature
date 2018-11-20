# language: pt
# encoding: utf-8

Funcionalidade: Pesquisa de salas livres por dia e hora.
	Como usuário autenticado do sistema
	Para que saber se há salas livres em certo dia e hora
	Eu quero poder visualizar quais salas não tem reserva em certo dia e hora
	
	Cenário: Lista de salas aparece adequadamente

		Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
		E eu esteja no página principal com caminho "/"
		E existam as seguintes salas cadastradas no sistema: 
		  |name  	 | Pjc-54 |
		  |location	 | PJC-BT |
		  |name		 | Pat-45 |
      	  |location	 | PAT-AT |
		E exista o seguinte aluguel cadastrado no sistema:
	  	|appointment_date| Amanha		   |
	  	|start_time 	   | 08:00:00 	 |
	  	|name   				 | Pjc-54 		 |
	  	|location 			 | PJC-BT  		 |
		Quando eu clicar no link "Buscar Salas Livres"
		Então eu esteja no página principal com caminho "/search-rooms"
		E preencher o dia do alugel com:
      |date_search| Amanha |
		E selecionar o seguinte horário de "8:00 - 10:00" da manhã para buscar
		E clicar no botão "Buscar"
		Então eu esteja no página principal com caminho "/search-result"
    Então eu devo estar em uma página com uma tabela com os dados:
      |name  	 | Pat-45 |
      |location| PAT-AT |	