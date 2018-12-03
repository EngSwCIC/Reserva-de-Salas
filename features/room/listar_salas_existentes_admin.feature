#language: pt
#encoding: utf-8

Funcionalidade: Listar todas as salas do sistema
  Como administrador do sistema,
  Quero poder visualizar todas as salas no sistema
  Para verificar quais salas estão disponíveis para alguel

  Cenário: Lista de salas aparece adequadamente

    Dado que eu esteja logado como administrador com o email "admin@admin.com" e a senha "admin123"
    E eu esteja no "backoffice"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no link "Ver lista de salas existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
      |name  | Pat-45 |
      |location| PAT-AT |