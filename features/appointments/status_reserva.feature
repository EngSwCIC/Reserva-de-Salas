# language: pt
# encoding: utf-8

Funcionalidade: Confirmar agendamentos dinamicamente
Eu como admin quero poder
editar os agendamentos sem que a
página recarregue para cada agendamento

  Contexto:
    Dado que eu esteja cadastrado e logado como administrador do sistema
    E eu esteja na pagina backoffice
    Então eu devo estar em uma página com uma tabela com os dados:
    | # | Usuário | Sala   | Data do aluguel      | Início               | Status           |
    | 1 | rafael  | teste1 | 23/09/2021 - 12:00AM | 01/01/2000 - 06:00AM | Aprovar Reprovar |

  # Cenario Triste aprovado apos vencimento
  Cenario: Um Administrador aprova uma requisição após a data de seu vencimento
  Dado que exista a sala "Pat-45", "23/09/2021" no horario "12:00AM"
  E que a data e horário atual sejam após "23/09/2021 12:00AM"
  Quando eu clicar no botão "Aprovar"
  Então deve aparecer uma mensagem na tela dizendo "Requisição vencida!"
  # Entao a label deve mudar para "Aprovado"

  # Cenario Triste aprovacao no mesmo horario
  Cenario: Um administrador aprova duas requisições da mesma sala no mesmo horário
  Dado que exista a sala "Pat-45", "50", "PAT-AT" cadastrada no sistema
  E a sala "Pat-45" possua uma requisição aprovada no horário de "8:00 - 10:00"
  Quando eu clicar no botão "Aprovar" para a requisição da sala "Pat-45" no horário de "8:00 - 10:00"
  Então deve aparecer uma mensagem na tela dizendo "Algo deu errado!"

  # Cenario Feliz aluguel aprovado
  Cenario: Um Administrador aprova uma requisição
  Dado que exista a sala "Pat-45", "50", "PAT-AT" cadastrada no sistema
  E que a sala "Pat-45" não possua requisições no horário de "8:00 - 10:00"
  Quando eu clicar no botão "Aprovar"
  Então deve aparecer uma mensagem na tela dizendo "Aprovado com sucesso!"
  # Entao a label deve mudar para "Aprovado"

  # Cenario Feliz aluguel reprovado
  Cenario: Um Administrador reprova uma requisição
  Dado que exista a sala "Pat-45", "50", "PAT-AT" cadastrada no sistema
  E que a sala "Pat-45" possua requisições no horário de "14:00 - 16:00"
  Quando eu clicar no botão "Reprovar"
  Então deve aparecer uma mensagem na tela dizendo "Reprovado, a sala está já está reservada!"
  # Entao a label deve mudar para "Reprovado"
