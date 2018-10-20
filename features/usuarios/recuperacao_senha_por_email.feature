# language: pt
# encoding: utf-8

Funcionalidade: Recuperação de senha por email para log in.  (2)
	Como usuário autenticado no sistema
	Para que possa voltar a acessar o sistema caso tenha perdido a senha
	Eu quero receber um e-mail de recadastramento de senha
	
		Cenário: Um email com instruções para novo cadastramento de senha é recebido quando solicitado

			Dado que eu esteja na página de login do sistema com caminho “/login”
			E existam os campos para preenchimento: “email”, “senha” 	
			Quando eu clicar no botão “Esqueceu sua senha?”
			Então eu devo estar em uma página com o texto “Instruções para cadastramento de nova senha enviadas por email”
			E devo receber no email cadastrado as instruções para novo cadastro de senha, com o seguinte modelo:
			“Caro usuário (nome do usuário), para realizar a mudança da sua senha clique no link disponibilizado abaixo.”
			E o email deve conter um link para uma nova página do sistema com o campo “Digite uma nova senha”
			E ao clicar no botão “Enviar”
			Então a nova senha do usuário é cadastrada no sistema

			Exemplo: Dado usuário André com email andre@hotmail.com, ao clicar no botão “Esqueceu sua senha ”, recebo em minha caixa de emails de andre@hotmail.com:

			“ Caro usuário André, para realizar a mudança da sua senha clique no link disponibilizado abaixo.

			<link para mudança>” 

