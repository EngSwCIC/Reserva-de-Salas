Funcionalidade: Quantidade de horários reservados
    Eu como administrador do sistema,
    Quero poder ver a quantidade de horários reservados
    Para ter uma noção melhor de quantos horários tem de sobra.

Contexto:
    Dado que eu sou administrador do sistema logado que esteja na página "backoffice" quando 
    eu clicar no link "Mostrar os horários reservados"

# Caminho Feliz
Cenário: Mostra a quamtodade de horários reservados.
    Dado que eu aprovei reservas em alguns dias e horarios
    Então eu devo ver em um icone a quantidade de horarios geral que estão reservados.
    Exemplo:
    -Horários reservados TOTAL: 9.

# Caminho Triste
Cenário: Não mostra ou mostra 0 horários reservados.
    Dado que eu esteja no dashboard do admin
    Então eu não devo ver nada ou "Não foram reservado horários"