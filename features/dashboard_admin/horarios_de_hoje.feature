                  #language: pt
                  #encoding: utf-8

                  @wip
                  Funcionalidade: Ver todos os horários reservados para o dia atual
                  Como Administrador do sistema
                  Eu quero ver na Dashboard quais os horários reservados de hoje
                  Para ter um melhor entendimento do que está acontecendo

                  Contexto:
                  Dado que eu sou o administrador do sistema com email "admin@admin.com" senha "admin123"
                  E meu usuário admin é válido

                  # Caminho Feliz
                  Esquema do Cenario: Ver 1 horário
                  Dado que eu tenha aprovado uma reserva de um usuário para hoje no horario <horario>
                  E que eu esteja na pagina backoffice
                  Então eu devo ver <horario> na tabela de horários
                  Exemplos:
                  | horario |
                  | 14:00   |
                  | 16:00   |

# Caminho Triste
Cenário: Ver 0 horários
E que eu esteja na pagina backoffice
Então devo ver "Não há horários reservados para hoje."

