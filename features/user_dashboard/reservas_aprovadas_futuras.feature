# language: pt
# encoding: utf-8

Funcionalidade: Visualização de reservas aprovadas com datas futuras
  Como usuário autenticado do sistema
  Eu quero acessar minhas reservas
  Para visualizar as minhas reservas aprovadas com datas futuras

  Contexto: Login de um usuário
    Dado que eu esteja cadastrado como um usuário
    E que eu esteja logado
    Então eu devo ver "Home" no topo da página
  
  Cenário: Um usuário visualiza suas reservas aprovadas com datas futuras com sucesso
    Dado que exista uma sala cadastrada no sistema
    E a reserva desta sala tenha sido realizado pelo o usuáro para uma data futura
    E a reserva tenha sido aprovada
    Então eu devo ver três tabelas
    E eu devo ver um tabela com título "Reservas Aprovadas"
    E eu devo ver pelo menos uma reserva nessa tabela com data futura 	

  Cenário: Um usuário falha em visualizar suas reservas aprovadas com datas futuras
    Dado que exista uma sala cadastrada no sistema
    E a reserva desta sala tenha sido realizado pelo o usuáro para o dia atual
    E a reserva tenha sido aprovada 
    Então eu devo ver três tabelas
    E eu devo ver um tabela com título "Reservas Aprovadas"
    E eu não devo ver nenhuma reserva nessa tabela com data futura 	