#language: pt
#encoding: utf-8
@wip
Funcionalidade: Quantidade de horários reservados
    Eu como administrador do sistema,
    Quero poder ver a quantidade de horários reservados
    Para ter uma noção melhor de quantos horários tem de sobra.

Contexto:
    Dado que eu sou o administrador do sistema com email "admin@admin.com" senha "admin123"
    E que esteja na página "backoffice"

#Sucesso
Cenario: Mostrar a quantidade de horarios reservados
    Dado que exista salas com reservas confirmadas
    Entao eu devo ver "Nº de Reservas Confirmadas 1"

#Falha
Cenario: Não mostrar a quantidade de horarios reservados
    Entao eu devo ver "Nº de Reservas Confirmadas 0"