##ribas
	
	#language: pt
	#encoding: utf-8

	Funcionalidade: Filtro por classificação dos tipos de sala
		Como usuário autenticado do sistema
		Para que encontre as salas que tem equipamentos apropriados para meu objetivo
		Eu quero filtrar a lista de salas para reserva pelo tipo de sala
	
	Cenário: Filtragem das salas por categoria ocorre perfeitamente  
	
		Dado que eu esteja logado no sistema com o seguinte login de usuario comum "teste@teste.teste" e senha "testeseed"
		
		E estejam cadastrados no sistema as seguintes salas:
			|name  | Lab 1 |
			|location| Predio CIC |
			|tipo_sala| Laboratórios |

			|name  | Multiuso Norte |
			|location| Predio CIC |
			|tipo_sala| Multiuso |

			|name  | Auditorio Principal |
			|location| Predio CIC |
			|tipo_sala| Auditórios |

			|name  | Aula 1 |
			|location| Predio CIC |
			|tipo_sala| Salas de Aula |
			
			|name  | Coodernação |
			|location| Predio CIC |
			|tipo_sala| Salas de Reunião |
		
		E eu esteja na "rooms" onde sera exibido uma lista com todas as salas cadastradas

		Quando eu clicar no botão "Tipos de Sala" será exibido uma lista com os tipos de salas existentes para serem alugadas:
				|Auditórios      ||
				|Laboratórios    ||
				|Multiuso        ||
				|Salas de Aula   ||
				|Salas de Reunião||
		Então Ao escolher o tipo "Salas de Reunião", a lista será filtrada e atualizada de acordo:
			|| Coodernação |
    		|| Predio CIC |
			|| Salas de Reunião |