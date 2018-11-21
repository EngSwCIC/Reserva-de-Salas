#language: pt
#encoding: utf-8

Funcionalidade: Automatizar reserva de sala para salas não reservadas (tirar intermédio do admin onde não há conflito)
	Como usuário autenticado do sistema
	Para que o sistema precisa de menos intervenção do admin
	Eu quero que as reservas em salas que não tenham uma reserva prévia sejam automaticamente aprovadas
	
		Esquema do Cenario: Um aluguel feito em um horário disponível é automaticamente aprovado
			Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
	    E eu esteja no página principal com caminho "/"
			E existam as salas cadastradas no sistema: "<name>", "<location>"
			Quando eu clicar no botao "Salas Existentes"
			Então eu devo estar em uma página com uma tabela com os dados:
			|name  | Pat-45 |
			|location| PAT-AT |
			Quando eu clicar no link "Aluguel" próximo ao nome da sala
			E preencher o dia do alugel com:
			|appointment_date| Amanha |
			E selecionar o seguinte horário de "8:00 - 10:00" da manhã
			E clicar no botão "Alugar"
			Então deve aparecer uma mensagem na tela dizendo "Alguel realizado com sucesso"
			Exemplos:
			|name   | location |
			|Pat-45 | PAT-AT   |

		Esquema do Cenario: Um alguel feito em um horário não disponível é colocado como solicitado
			Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
	    E eu esteja no página principal com caminho "/"
			E existam as salas cadastradas no sistema: "<name>", "<location>"
			E existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
			Quando eu clicar no botao "Salas Existentes"
			Então eu devo estar em uma página com uma tabela com os dados:
			|name  | Pat-45 |
			|location| PAT-AT |
			Quando eu clicar no link "Aluguel" próximo ao nome da sala
			E preencher o dia do alugel com:
			|appointment_date| Amanha |
			E selecionar o seguinte horário de "8:00 - 10:00" da manhã
			E clicar no botão "Alugar"
			Então deve aparecer uma mensagem na tela dizendo "Seu aluguel foi solicitado a um administrador pois a sala já está reservada"
			Exemplos:
			|appointment_date| start_time | name   | location |
			| Amanha         | 08:00:00   | Pat-45 | PAT-AT   |