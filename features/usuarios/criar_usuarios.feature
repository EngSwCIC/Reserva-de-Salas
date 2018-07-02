# language: pt
# encoding: utf-8

Funcionalidade: Cadastro de novo usuário no sistema
  Como usuário não autenticado
  Eu quero me cadastrar no sistema
  Para que eu possa olhar e reservar as salas que desejar

  Cenario: Um usuário cria uma conta com sucesso
    Dado que eu esteja na página principal
    Quando eu clicar em "Cadastro"
    E eu esteja agora em uma página com título "Sign up"
    Quando eu preencher o formulário com:
      | user_username | usuario1 |
      | user_password | password123 |
      | user_password_confirmation | password123 |
      | user_registration          | 150150296   |
      | user_course | Ciência da Computação      |
      | user_email |   a@a.com                   |
    E clicar no botão "Sign up"
    Então eu devo ser redirecionado para a página inicial