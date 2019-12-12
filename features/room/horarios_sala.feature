# language: pt
# encoding: utf-8

Funcionalidade: Checar Horários Disponíveis
    Como usuário cadastrado e autenticado
    quero checar os horários disponíveis para 
    uma sala.

#Happy path
Cenário: Um usuário abre a página horários disponíveis e vê um horário indisponível
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    E exista um aluguel para amanhã, para às "18:00"
    Quando eu clicar no botão "Salas Existentes"
    E eu clicar no link "Horários" próximo ao nome da sala
    Então eu devo ver a linha do dia de amanhã sem o horário "18:00"

#Sad path
Cenário: Um usuário abre a página horários disponíveis e vê todos horários disponíveis
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    Quando eu clicar no botão "Salas Existentes"
    E eu clicar no link "Horários" próximo ao nome da sala
    Então eu devo ver a linha do dia de amanhã com o horário "18:00"

