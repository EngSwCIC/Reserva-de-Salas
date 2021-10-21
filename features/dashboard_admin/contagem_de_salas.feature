			#language: pt
			#encoding: utf-8

		@wip
		Funcionalidade: Listar todas as salas do sistema
			Como Administrador do sistema
			Eu quero ver uma lista de todas as salas disponíveis no sistema

		Contexto:
			Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
			E que eu esteja na pagina backoffice

		# Caminho Feliz
			Esquema do Cenario: Listar todas as salas
			Dado que existam salas com nome "<name>", locaização "<location>" e capacidade da sala "<students>"
			Então aparece um numero "<rooms>" mostrando a quantidade de salas no sistema
			E eu clicar no link "Todos as salas"
			Então eu devo ver uma tabela com os dados:

			| name               | <name>     |
			| location           | <location> |
			| students           | <students> |

			Exemplos:
			| name                   | location                                                | students |
			| Auditorio do CIC       | Prédio de Ciência da Computação e Estatística - CIC/EST | 200      |
			| Multuso do CIC         | Prédio de Ciência da Computação e Estatística - CIC/EST | 50       |
			| Centro Comunitário A.B | Campus Universitario Darcy Ribeiro                      | 2.000    |

		# Caminho Triste
			Esquema do Cenário: Listar salas quando não tiver nenhuma sala
			E que não tiver nenhuma sala cadastrada no sistema
			Quando eu clicar no link "Todos as salas"
			Então nenhuma sala deve ser mostrada

			Exemplos:
			| name | location | students |