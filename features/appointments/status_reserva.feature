# language: pt
# encoding: utf-8

Funcionalidade: Eu como admin quero poder 
  editar os agendamentos sem que a 
  página recarregue para cada agendamento

  Contexto:
    Dado que eu esteja logado como Administrador do Sistema
    E eu esteja na pagina Backoffice com caminho "/all-appointments"
    Então eu devo estar na página com uma tabela com os dados: 
    | #	| Usuário |	Sala	 | Data do aluguel	       | Início	                 | Status              |	
    | 1 | rafael  | teste1 | 2021-09-23 00:00:00 UTC | 2000-01-01 06:00:00 UTC | Aprovado  Reprovado |

  # Cenario Triste
  Cenario: Um Administrador 
  Quando eu clicar no botão "Aprovado" 

  # Cenario Triste
  Cenario: Um Administrador 
  Quando eu clicar no botão "Reprovado" 

  # Cenario Feliz
  Cenario: Um Administrador 
  Quando eu clicar no botão "Aprovado" 

  # Cenario Feliz
  Cenario: Um Administrador 
  Quando eu clicar no botão "Reprovado" 