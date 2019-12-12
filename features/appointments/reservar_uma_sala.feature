# language: pt
# encoding: utf-8

Funcionalidade: Reservar uma sala no sistema
  Como usuário cadastrado e autenticado,
  quero solicitar aluguel de uma sala no sistema
  para poder utilizar em um determinado dia e horário.

  # Caso feliz
  Cenário: Um usuário faz uma solicitação de sala com sucesso
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no botão "Salas Existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no link "Aluguel" próximo ao nome da sala
    E preencher o dia do alugel com:
      |appointment_date| Amanha |
    E selecionar o seguinte horário de "8:00 - 10:00" da manhã
    E clicar no botão "Alugar"
    Então deve aparecer uma mensagem na tela dizendo "Aluguel realizado com sucesso!"

  # Caso triste
  Cenário: Um usuário não consegue realizar uma solicitação, pois deixou a data em branco
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no botão "Salas Existentes"
    Então eu devo estar em uma página com uma tabela com os dados:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no link "Aluguel" próximo ao nome da sala
    E selecionar o seguinte horário de "8:00 - 10:00" da manhã
    E clicar no botão "Alugar"
    Então deve aparecer uma mensagem na tela dizendo "Algo deu errado!"
