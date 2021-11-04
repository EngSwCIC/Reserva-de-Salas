# language: pt
# encoding: utf-8

Funcionalidade: Reservar uma sala no sistema
Como usuário cadastrado e autenticado,
quero solicitar aluguel de uma sala no sistema
para poder utilizar em um determinado dia e horário.

  Contexto:
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja na página principal
    E exista a sala "Pat-45", "50", "PAT-AT" cadastrada no sistema
    Quando eu clicar no botão "Salas Existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
    | name     | Pat-45 |
    | location | PAT-AT |

# Caso feliz
  Cenário: Um usuário faz uma solicitação de sala com sucesso
    Quando eu clicar no link "Aluguel" próximo ao nome da sala
    E clicar na célula "verde" correspondente ao horário de "10:00 - 12:00" de segunda-feira
    Então deve aparecer uma modal na tela com a sala "Pat-45" e o horário de "10:00 - 12:00" de segunda-feira
    E clicar no botão Reservar
    Então deve aparecer uma mensagem na tela dizendo "Sala reservada com sucesso!"

  Cenário: Um usuário faz uma solicitação de sala com sucesso preenchendo o campo descrição
    Quando eu clicar no link "Aluguel" próximo ao nome da sala
    E clicar na célula "verde" correspondente ao horário de "10:00 - 12:00" de segunda-feira
    Então deve aparecer uma modal na tela com a sala "Pat-45" e o horário de "10:00 - 12:00" de segunda-feira
    E preencher o campo descrição com "estudar"
    E clicar no botão Reservar
    Então deve aparecer uma mensagem na tela dizendo "Sala reservada com sucesso!"

# Caso triste
  Cenário: Um usuário não consegue reservar uma sala porque já estava ocupada.
    Quando eu clicar no link "Aluguel" próximo ao nome da sala
    E clicar na célula "vermelha" correspondente ao horário de "10:00 - 12:00" de segunda-feira
    Então deve aparecer uma mensagem na tela dizendo "Algo deu errado! Tente novamente"
