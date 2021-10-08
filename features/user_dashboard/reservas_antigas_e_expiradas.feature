# language: pt 
# encoding: utf-8   

Funcionalidade: Visualização de reservas antigas e expiradas 
  Como usuário autenticado do sistema 
  Quero acessar meus dashboard 
  Para visualizar meus pedidos antigos e expirados de reserva de sala 
  
Contexto: Login de um usuário 
  Dado que eu esteja cadastrado como um usuário 
  E que eu esteja logado 
  Então eu devo ver "Home" no topo da página 
   
Cenário: Um usuário visualiza suas reservas antigas e expiradas com sucesso
  Dado que exista um pedido de reserva  
  E que a reserva tenha sido realizada em uma data passada 
  Então eu devo ver três tabelas 
  E devo ver uma tabela com título "Reservas Antigas e Expiradas" 
  E devo ver pelo menos uma reserva nessa tabela com data passada 

Cenário: Um usuário falha em visualizar as reservas antigas e expiradas 
  Dado que exista um pedido de reserva 
  E que a reserva tenha sido realizada em uma data passada 
  Então eu devo ver três tabelas 
  E devo ver uma tabela com título "Reservas Antigas e Expiradas" 
  E devo ver nenhuma reserva nessa tabela com data passada 

  