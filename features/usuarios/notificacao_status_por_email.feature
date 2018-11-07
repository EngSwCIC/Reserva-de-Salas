# language: pt
# encoding: utf-8

Funcionalidade: Notificação por e-mail de mudança no status de reserva de sala (2)
	Como usuário cadastrado do sistema
	Para que saiba quando o pedido de reserva mudar de status
	Eu quero receber um e-mail informando que houve alteração do status da reserva
	
		Cenário: Um email informando ao usuário a respeito do status da sua reserva de sala
	
			Dado que eu efetuei o devido login no sistema 
			E selecionei uma data e horário de interesse
			E escolhi uma sala e cliquei no botão para solicitar a reserva
			Quando o pedido de reserva foi julgado pelo administrador do sistema
			Então recebo em minha caixa de emails um email informando a mudança do status da minha reserva. No seguinte formato:

			“Caro usuário (nome do usuário), o seu pedido de reserva para a sala (id da sala) para data (data) e horário (horário) foi aprovado/rejeitado.”

			Exemplo: Dado login como usuário André, pedido da sala PAT-45 para dia 15/10/2018 e hora 15h30:

			“Caro usuário André, o seu pedido de reserva para a sala PAT-45 para data 15/10/2018 e horário 15h30 foi aprovado.” 
