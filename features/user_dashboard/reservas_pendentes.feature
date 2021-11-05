#language: pt
#encoding: utf-8

Funcionalidade: Visualização de reservas pendentes
  Como usuário autenticado do sistema
  Eu quero acessar meu dashboard
  Para visualizar as minhas reservas pendentes

  Contexto: Login de um usuário
    Dado que eu esteja cadastrado como um usuário
    E que eu esteja logado
    Então eu devo ver "Home" no topo da página
  
  Cenário: Um usuário visualiza seus pedidos pendentes com sucesso
    Dado que exista uma sala cadastrada no sistema
    E a reserva desta sala tenha sido realizada pelo o usuário
    E a reserva ainda não tenha sido aprovada
    Então eu devo ver três tabelas
    E eu devo ver um tabela com título "Reservas Pendentes"
    E eu devo ver pelo menos uma reserva nessa tabela	

  Cenário: Um usuário falha em visualizar suas reservas pendentes
    Dado que exista uma sala cadastrada no sistema
    E a reserva desta sala tenha sido realizado pelo o usuáro
    E a reserva tenha sido aprovada
    Então eu devo ver três tabelas
    E eu devo ver um tabela com título "Reservas Pendentes"
    E eu não devo ver nenhuma reserva nessa tabela		


