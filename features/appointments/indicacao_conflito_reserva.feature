# language: pt
# encoding: utf-8

Funcionalidade: Indicação de conflito de reserva.
Como administrador autenticado do sistema
	Para que possa avaliar situações que dois usuário precisam da mesma sala no mesmo dia e hora. 
	Eu quero que a solicitação de reserva feita pelo usuário informe se há alguma reserva já feita naquela sala, naquele mesmo dia e hora.
	
	Cenario: Desde que eu esteja logado no sistema com o seguinte login de administrador, |user| admin@admin.admin 
|password| adminseed
	
Clique no botão “SALAS EXISTENTES” onde será exibido todas as salas disponíveis.
Na lista de salas exibidas , existe um indicador na sala em questão que dirá se a sala está disponível ou não para ser alugada.
Ao lado existe um botão “lista de espera para reserva”, caso a reserva atual seja cancelada o usuário será notificado por email que seu pedido de reserva foi aceito.
