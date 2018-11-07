# language: pt
# encoding: utf-8

Funcionalidade: Filtro de sala por salas ocupadas. (2)
	Como administrador autenticado do sistema.
	Para que realizar a devida manutenção prévia nas salas a serem ocupadas.
	Eu quero poder filtrar a busca de salas mostrando todas as salas ocupadas na semana.
	
	Cenario: Lista de salas ocupadas aparece adequadamente

	Dado que eu esteja cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin"
	E que esteja logado
	E que esteja na pagina "Todos aluguéis"
	E existam as salas cadastradas no sistema: "<name>", "<location>"
	E existam os seguintes alugueis cadastrados no sistema: "<appointment_date>", "<start_time>"
	E preencher o dia do aluguel com:
  	|appointment_date| Amanha |
	E clicar no botão "Pesquisar"
	Então eu devo estar em uma página com uma tabela com os dados "Pat-45", "PAT-AT"
	Exemplos:
  	|appointment_date| start_time | name   | location |
  	| Amanha     	| 08:00:00   | Pat-45 | PAT-AT   |
  	| Ontem      	| 10:00:00   | Pjc-54 | PJC-BT   |
