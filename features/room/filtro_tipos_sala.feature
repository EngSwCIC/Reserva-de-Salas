# language: pt
# encoding: utf-8

Funcionalidade: Filtro por classificação dos tipos de sala (laboratório, sala de aula, ...).
Como usuário autenticado do sistema
	Para que encontre as salas que tem equipamentos apropriados para meu objetivo
	Eu quero filtrar a lista de salas para reserva pelo tipo de sala.
	
	Cenario:  Desde que eu esteja logado no sistema com o seguinte login de usuario comum, |user| teste@teste.teste
|password| testeseed
Clique no botão “SALAS EXISTENTES” onde será exibido todas as salas disponíveis.
No canto superior direito acima da lista de salas exite um botão DROPDOWN com o nome “Filtro por tipo de sala”.
Ao clicar nesse botão será exibido uma lista com os tipos de salas existentes para serem alugadas. EX: laboratório, sala de aula, auditórios, … etc.
Ao escolher o tipo, a lista será filtrada e atualizada de acordo. 
