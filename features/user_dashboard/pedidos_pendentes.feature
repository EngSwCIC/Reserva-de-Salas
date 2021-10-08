#language: pt
#encoding: utf-8

Funcionalidade: Pedidos Pendentes

Como usuário autenticado no sistema

Eu quero saber se tenho pedidos pendentes para reservas de salas

Para saber se tenho ou quais pedidos de reserva de sala estão pendentes

Contexto: Login de um usuário

Dado que eu esteja cadastrado no sistema

E que eu esteja logado

Então devo ver "Home" no topo da página com as tabelas


Cenario: Usuário acessa a aréa de pedidos pendentes

Dado que eu esteja na pagina principal de usuário após a relização do login

Quando eu acessar aparece a tabela com os pedidos pendentes

Então aparecerá a pagina com a solicitações pendentes

Cenario: Usuário não acessa a aréa de pedidos pendentes

Dado que eu esteja na pagina principal de usuário após a relização do login

E ter solicitado a reservado de uma sala

Quando eu acessar a página principal

E não aparecer o pedido em nunhuma das tabelas montadas



