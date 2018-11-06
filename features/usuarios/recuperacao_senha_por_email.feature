#language: pt
#encoding: utf-8

Funcionalidade: Recuperação de senha por email para log in
  Como usuário do sistema
  Para que possa voltar a acessar o sistema caso tenha perdido a senha
  Eu quero receber um e-mail de recadastramento de senha

  Cenário: Email para novo cadastramento de senha
    Dado que eu esteja na página principal e seja um usuário cadastrado
	E eu clicar na opção "Login"
	Então eu devo estar agora em uma página com título "Log in" 
    Quando eu clicar na opção "Esqueceu sua senha ?"
    Então eu devo estar agora em uma página com título "Recuperação de senha" 
    Quando eu inserir meu email de usuário e clicar em "Enviar"
	Então devo receber em meu email cadastrado as instruções para novo cadastro de senha e clicar em Recadastrar Senha
	Então eu devo ser redirecionado para a página de recadastramento de senha 
	E ao inserir os campos Nova Senha "senha123" e Confirmação "senha123" e clicar no botão "Alterar Senha" a nova senha é atualizada no sistema
