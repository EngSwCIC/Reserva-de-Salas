# language: pt
# encoding: utf-8

Funcionalidade: Autenticação de usuários no sistema
  Como usuário cadastrado, mas deslogado
  Eu quero me autenticar no sistema
  Para que eu possa acessar meu perfil e reservar salas que desejar

  Cenário: Um usuário faz autenticação no sistema com sucesso
    Dado que eu esteja na página principal e já seja um usuário cadastrado
    Quando eu clicar em "Login"
    E eu esteja agora em uma página com o título "Login"
    Quando eu preencher o formulário com:
      | user_email | a@a.com |
      | user_password | password123 |
    E clicar em "Log in"
    Então deve haver um botão na tela com a opção de "Logout" pois eu já estarei logado no sistema