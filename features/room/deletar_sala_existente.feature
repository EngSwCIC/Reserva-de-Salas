#language: pt
#encoding: utf-8

Funcionalidade: deletar_sala_existente
  Como Administrador do sistema
  Para que eu mantenha a lista de salas organizadas
  Eu quero deletar uma sala

  Cenário: Deletar uma sala com sucesso
  Dado que eu esteja cadastrado e logado como administrador do sistema
  E já exista uma sala cadastrada no sistema
  E eu esteja na pagina backoffice
  E eu clique no link "Ver lista de salas existentes"
  Quando eu clicar no botao "Deletar"
  Então eu devo ver uma mensagem "A sala foi deletada com sucesso"
  