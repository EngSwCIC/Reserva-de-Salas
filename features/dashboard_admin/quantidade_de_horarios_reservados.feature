#language: pt
#encoding: utf-8

@wip
Funcionalidade: Quantidade de horários reservados
    Eu como administrador do sistema,
    Quero poder ver a quantidade de horários reservados
    Para ter uma noção melhor de quantos horários tem de sobra.

Contexto:
    Dado que eu sou administrador do sistema com email "admin@admin.com" senha "admin123"
    E que eu esteja na pagina backoffice

# Caminho Feliz
Esquema do Cenario: Ver quantidade total de horários reservados
    Dado que eu clique em um botao "horarios reservados"
    Então eu devo ver em um texto 'horarios totais reservados' com a quantidade de horarios total que estão reservados.
    Exemplo:
    -Horários reservados TOTAL: 9.

# Caminho Triste
Cenário: Ver 0 horários reservados.
    Então devo ver nada ou "Não há horários"