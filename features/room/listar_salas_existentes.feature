#language: pt
#encoding: utf-8

Funcionalidade: Listar todas as salas do sistema
  Como usuário comum autenticado no sistema,
  Quero poder visualizar todas as salas no sistema
  Para verificar quais salas estão disponíveis para alguel

  Cenário: Lista de salas aparece adequadamente

    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no botão "Ver lista de salas existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
      |name  | Pat-45 |
      |location| PAT-AT |