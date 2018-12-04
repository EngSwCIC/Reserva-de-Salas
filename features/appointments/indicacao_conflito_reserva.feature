##ribas

	#language: pt
	#encoding: utf-8

	Funcionalidade: Indicação de conflito de reserva.
		Como administrador autenticado do sistema
		Para que possa avaliar situações que dois usuário precisam da mesma sala no mesmo dia e hora.
		Eu quero que a solicitação de reserva feita pelo usuário informe se há alguma reserva já feita naquela sala, naquele mesmo dia e hora.
	
	Cenário: Gerenciamento de conflitos ocorre perfeitamente

		Dado que eu esteja logado no sistema com o seguinte login de administrador "admin@admin.admin" e senha "adminseed"

		E estejam cadastrados no sistema os seguintes alugueis:

			|appointment_date  | 22-06-2018 |
			|start_time        | 10:00:00 |
			|room.name         	   | Lab 1 |

			|appointment_date  | 22-06-2018 |
			|start_time        | 10:00:00 |
			|room         	   | Lab 1 |

			|appointment_date  | 03-12-2018 |
			|start_time        | 08:00:00 |
			|room         	   | Auditório |

		E eu esteja na "all-appointments" onde sera exibido uma lista com todos os alugueis, onde a cor do botão for azul significa que não ha conflito e se botão for vermelho há conflito de alugueis

		Quando eu clicar no botão "Lab 1" VERMELHO será exibido uma lista dos alugueis em CONFLITO:
			|         1    ||
			| admin        ||
			| Lab 1        ||
			| 22-06-2018   ||
			| 10:00:00 	   ||
			| Editar       ||

			|         1    ||
			| admin        ||
			| Lab 1        ||
			| 22-06-2018   ||
			| 10:00:00 	   ||
			| Editar       ||

		Quando eu clicar no botão "Auditório" AZUL será exibido apenas o aluguel em questão:
			|         2    ||
			| admin    	   ||
			| Auditório    ||
			| 03-12-2018   ||
			| 08:00:00 	   ||
			| Editar       ||
