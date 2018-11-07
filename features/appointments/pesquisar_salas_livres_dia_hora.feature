# language: pt
# encoding: utf-8

Funcionalidade: Pesquisa de salas livres por dia e hora. (2)
	Como usuário autenticado do sistema
	Para que saber se há salas livres em certo dia e hora
	Eu quero poder visualizar quais salas não tem reserva em certo dia e hora
	
	Cenário: Lista de salas aparece adequadamente

	Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
	E eu esteja no página principal com caminho "/"
	E existam as salas cadastradas no sistema: "<name>", "<location>"
	E existam os seguintes alugueis cadastrados no sistema: "<appointment_date>", "<start_time>"
	Quando eu clicar no botão "Salas Disponiveis"
	E preencher o dia do aluguel com:
  	|appointment_date| Amanha |
	E selecionar o seguinte horário de "8:00 - 10:00" da manhã
	E clicar no botão "Pesquisar"
	Então eu devo estar em uma página com uma tabela com os dados "Pjc-54", "PJC-BT"
	Exemplos:
  	|appointment_date| start_time | name   | location |
  	| Amanha     	| 08:00:00   | Pat-45 | PAT-AT   |
  	| Amanha     	| 10:00:00   | Pjc-54 | PJC-BT   |
