# language: pt
# encoding: utf-8

Funcionalidade: Editar usuário no sistema
  Como usuário autenticado
  Eu editar meu perfil
  Para que eu manter dados atualizados sobre mim

  Cenario: Um usuário edita seus dados com sucesso
    Dado que eu esteja na página principal e já seja um usuário cadastrado
    Quando eu clicar em "Login"
    E eu esteja agora em uma página com o título "Login"
    Quando eu preencher o formulário com:
      | user_email | a@a.com |
      | user_password | password123 |
    E clicar em "Log in"
    Então deve haver um botão na tela com a opção de "Logout" pois eu já estarei logado no sistema
    Quando eu clicar no botão "Edit" nessa mesma página
    E eu esteja em uma página com o título "Edit User"
    Quando eu preencher o formulário com:
      | user_email | novo_email@a.com |
      | user_username | novo_usuario |
      | user_registration | 150155978   |
      | user_course | Engenharia de Computação      |
      | user_current_password | password123      |
    E clicar no botão "Update"
    Então eu devo estar novamente na página inicial de perfil
    E meu usuário deve estar com os campos atualizados como "novo_email@a.com"