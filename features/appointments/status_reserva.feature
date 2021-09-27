# language: pt
# encoding: utf-8

Funcionalidade: Confirmar agendamentos dinamicamente
Eu como admin quero poder
editar os agendamentos sem que a
página recarregue para cada agendamento

  Contexto:
    Dado que eu esteja logado como Administrador do Sistema
    E eu esteja na pagina Backoffice com caminho "/all-appointments"
    Então eu devo estar na página com uma tabela com os dados:
    | # | Usuário | Sala   | Data do aluguel         | Início                  | Status              |
    | 1 | rafael  | teste1 | 2021-09-23 00:00:00 UTC | 2000-01-01 06:00:00 UTC | Aprovado  Reprovado |

  # Cenario Triste aprovado apos vencimento
  Cenario: Um Administrador aprova uma requisição após a data de seu vencimento
  Dado exista a sala "PAT-45", "2021-09-23" na data "00:00:00 UTC"
  E que a data e horário atual sejam após  "2021-09-23", "00:00:00 UTC"
  Quando eu clicar no botão "Aprovado"
  Então deve aparecer uma mensagem na tela dizendo "Requisição vencida!"

  # Cenario Triste aprovacao no mesmo horario
  Cenario: Um administrador aprova duas requisições da mesma sala no mesmo horário
  Quando eu clicar no botão "Aprovado"
  Dado que exista a sala "Pat-45", "50", "PAT-AT" cadastrada no sistema
  E a sala "Pat-45" possua uma requisição aprovada no horário de "8:00 - 10:00" da manhã
  Quando eu clicar no botão "Aprovado" para a requisição da sala "Pat-45" no horário de "8:00 - 10:00" da manhã
  Então deve aparecer uma mensagem na tela dizendo "Algo deu errado!"

  # Cenario Feliz aluguel aprovado
  Cenario: Um Administrador 
  Quando eu clicar no botão "Aprovado"
  Então o botão "Aprovado" mudara de cor

  # Cenario Feliz aluguel reprovado
  Cenario: Um Administrador
  Quando eu clicar no botão "Reprovado"
