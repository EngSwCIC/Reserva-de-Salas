#language: pt
#encoding: utf-8

Funcionalidade: Listar todas as salas do sistema
  Como usuário comum autenticado no sistema,
  Quero poder visualizar todas as salas no sistema
  Para verificar quais salas estão disponíveis para alguel

  Contexto:
    Dado que eu esteja cadastrado como usuario "user@user.com", "123123", "Engenharia", "15/0115474", "user"
    E que esteja logado
    E que esteja na pagina inicial
    E eu clicar no link "Salas Existentes"

  Cenário: Lista de salas aparece adequadamente
    E exista a sala "Pat-45", "50", "PAT-AT" cadastrada no sistema
    Quando eu clicar no botão "Salas Existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
      | name     | Pat-45 |
      | location | PAT-AT |
      | capacity | 50     |