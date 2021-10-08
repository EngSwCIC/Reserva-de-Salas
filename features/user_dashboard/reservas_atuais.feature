# language: pt
# encoding: utf-8

Funcionalidade: Visualização de reservas para dia atual
  Como usuário autenticado do sistema
  Eu quero acessar minhas reservas
  Para visualizar as minhas reservas para o dia atual

  Contexto: Login de um usuário
    Dado que eu esteja cadastrado como um usuário
    E que eu esteja logado
    Então eu devo ver "Home" no topo da página
  
  Cenário: Um usuário visualiza suas reservas para o dia atual com sucesso
    Dado que exista uma sala cadastrada no sistema
    E a reserva desta sala tenha sido realizado pelo o usuáro para o dia atual
    Então eu devo ver três tabelas
    E eu devo ver as reservas para o dia atual em destaque nas tabelas

  Cenário: Um usuário falha em visualizar suas reservas atuais
    Dado que exista uma sala cadastrada no sistema
    E o aluguel desta sala tenha sido realizado pelo o usuáro para um dia que não seja o atual
    Então eu devo ver três tabelas	
    E não deve haver nenhuma reserva em destaque nas tabelas	
