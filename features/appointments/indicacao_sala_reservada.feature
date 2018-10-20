# language: pt
# encoding: utf-8

Funcionalidade: indicação de sala já reservada.
	Como usuário autenticado do sistema
	Para que saiba previamente que a sala já está reservada por outro usuário
	Eu quero que o sistema indique que a sala já está reservada para uso naquele dia e horário.
	
	Cenario: É indicado quando uma sala já foi reservada
Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
E eu esteja no página principal com caminho "/"
E existam as seguintes salas cadastradas no sistema:
|name  | Pat-45 |
|location| PAT-AT |
E existam os seguintes alugueis cadastrados no meu nome:
|appointment_date| start_time | name   | location |
| Amanha         | 08:00:00   | Pat-45 | PAT-AT   |
Quando eu clicar no botão "Salas Existentes"
Então eu devo estar em uma página com uma tabela com os dados:
|name  | Pat-45 |
|location| PAT-AT |
Quando eu clicar no link "Aluguel" próximo ao nome da sala
E preencher o dia do alugel com:
|appointment_date| Amanha |
E selecionar o seguinte horário de "8:00 - 10:00" da manhã
E clicar no botão "Alugar"
Então deve aparecer uma mensagem na tela dizendo "Sala já reservada!"
