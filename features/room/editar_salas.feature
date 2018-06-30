# language: pt
# encoding: utf-8

Funcionalidade: Editar sala no sistema
  Como administrador autenticado
  Eu editar uma sala
  Para que eu manter dados atualizados sobre a sala

  Cenario: Um administrador edita uma sala com sucesso
    Dado que eu esteja na página principal e já seja um administrador cadastrado e já exista uma sala cadastrada
    Quando eu clicar em "Login"
    E eu esteja agora em uma página com o título "Log in",
    Quando eu preencher o formulário com:
      | user_email | admin@admin.admin |
      | user_password | adminseed |
    E clicar em "Log in" 
    Então deve haver um botão na tela com a opção de "Ver lista de salas existentes" pois eu já estarei logado no sistema
    Quando eu clicar no botão "Ver lista de salas existentes" nessa mesma página
    E eu esteja em uma página com o título "Listagem de salas"
    Então deve haver um botão na tela com a opção de "Show" pois estarei vendo as salas do sistema
    Quando eu clicar no botão "Edit" nessa mesma página
    E eu esteja em uma página com o título "Edit Room"
    Quando eu preencher o formulário com:
      | room_name | SalaTeste |
      | room_location | LocalizacaoTeste |
    E clicar no botão "Update"
    Então eu devo estar na página de visualização de sala
    E minha sala deve estar com os campos atualizados como "SalaTeste"