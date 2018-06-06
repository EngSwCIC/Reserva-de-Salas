#language: pt
#encoding: utf-8

Funcionalidade: realizar_sessoes_admin
  Como Administrador do sistema
  Para que eu acesse o Backoffice da aplicação
  Eu quero realizar sessões no sistema

  Cenario: Realizar sessões
  Dado que eu esteja na página principal e já seja um usuário cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin" 
  E eu clicar no link para inicio de sessao "Login"
  Quando eu preencher o campo email e password com:
  |Email|admin@admin.com|
  |Password|123123|
  E eu clicar no botão para iniciar sessao "Log in"
  Entao eu devo ser redirecionado para a pagina "backoffice" 

  Cenario: Realizar sessões inválidas
  Dado que eu esteja na página principal e já seja um usuário cadastrado como "admin@admin.com", "123123", "Engenharia", "15/0115474", "admin" 
  E eu clicar no link para inicio de sessao "Login"
  Quando eu preencher o campo email e password com:
  |Email|admin@admin.com|
  |Password|123124|
  E eu clicar no botão para iniciar sessao "Log in"
  Entao eu devo ser redirecionado para a pagina "login" 