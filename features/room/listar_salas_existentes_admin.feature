#language: pt
#encoding: utf-8

Funcionalidade: Listar todas as salas do sistema
  Como administrador do sistema,
  Quero poder visualizar todas as salas no sistema
  Para verificar quais salas estão disponíveis para aluguel

  Esquema do Cenário: Lista de salas aparece adequadamente

    Dado que eu esteja logado como administrador com o email "admin@admin.com" e a senha "admin123"
    E eu esteja no "backoffice"
    E existam as salas <name>, <students>, <location> cadastradas no sistema:
    Quando eu clicar no botão "Ver lista de salas existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
      |name  | pt-67 |
      |students|45|
      |location| PJC |
    
    Exemplos:
      | name | students | location |
      | "pt-67"  | 45  | "PJC" |