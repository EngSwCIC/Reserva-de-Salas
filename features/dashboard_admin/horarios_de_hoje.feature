#language: pt
#encoding: utf-8

Funcionalidade: Ver todos os horários reservados para o dia atual
  Como Administrador do sistema
  Eu quero ver na Dashboard quais os horários reservados de hoje
  Para ter um melhor entendimento do que está acontecendo

  Contexto:
    Dado que eu sou um administrador logado

  # Caminho Feliz
  Esquema do Cenario: Ver 1 horário
    Dado que eu tenha aprovado uma reserva de um usuário no <dia> e horario <horario>
    E eu esteja na dashboard do admin
    Então eu devo ver <horario> na tabela de horários
    Exemplos:
    |dia |horario |
    |Hoje|14:00:00|
    |Hoje|16:00:00|

  # Caminho Triste
  Cenário: Ver 0 horários
    Dado que eu esteja na dashboard do admin
    Então devo ver "Não há horários reservados hoje."

