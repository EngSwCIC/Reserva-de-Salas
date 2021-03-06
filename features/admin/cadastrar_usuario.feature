# language: pt
# encoding: utf-8

Funcionalidade: Cadastro de novo usuário aluno no sistema
  Como Administrador do Sistema
  Eu quero cadastrar um usuário
  Para que ele possa fazer login no sistema

  Contexto:
    Dado que existe o usuário "admin@admin.com", "adminadmin", "Engenharia", "15/0115474", "admin"
    E que esteja autenticado
    E que esteja na pagina Backoffice
    E eu clicar no link "Cadastrar um novo usuário"

  Cenario: Um administrador cadastra um usuário com sucesso
    Quando eu preencher formulário com os dados:
      | user_username              | usuario1               |
      | user_password              | password123            |
      | user_password_confirmation | password123            |
      | user_registration          | 150150296              |
      | user_course                | Ciência da Computação  |
      | user_email                 | a@a.com                |
    E clicar em "Cadastrar"
    # Então eu devo ser redirecionado para a página Backoffice
    E deve haver um alerta de sucesso
    E o usuário deve estar cadastrado no banco de dados

Cenario: Um administrador cadastra outro administrador
    Quando eu preencher formulário com os dados:
      | user_username              | usuario1               |
      | user_password              | password123            |
      | user_password_confirmation | password123            |
      | user_registration          | 150150296              |
      | user_course                | Ciência da Computação  |
      | user_email                 | a@a.com                |
    E marcar o checkbox de usuário administrador
    E clicar em "Cadastrar"
    # Então eu devo ser redirecionado para a página Backoffice
    E deve haver um alerta de sucesso

Cenario: Tentar cadastrar usuário com email já cadastrado
    Quando eu preencher formulário com os dados:
      | user_username              | usuario1               |
      | user_password              | password123            |
      | user_password_confirmation | password123            |
      | user_registration          | 150150296              |
      | user_course                | Ciência da Computação  |
      | user_email                 | admin@admin.com        |
    E clicar em "Cadastrar"
    Então eu devo permanecer na página de cadastro
    E deve haver um alerta de erro de email existente para o email "admin@admin.com"
