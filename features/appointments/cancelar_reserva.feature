#language: pt
#encoding: utf-8

Funcionalidade: cancelar_reserva
  Como Usuario Autentica
  Para que eu libere a disponibilidade de uma sala
  Eu quero cancelar uma reserva

    Esquema do Cenario: Destruir uma sala 
    Dado que eu esteja logado como usuário comum com o email "xela@email.com" e a senha "123123"
    E eu esteja no página principal com caminho "/"
    E existam as salas cadastradas no sistema: "<name>", "<location>"
    E existam as seguintes reservas cadastrados no meu nome: "<appointment_date>", "<start_time>"
    E eu clicar no botão "Minhas reservas"
    Quando eu clicar em "Cancelar reserva"
    Então eu devo ver uma mensagem "A reserva foi cancelado com sucesso!"
    Exemplos:
    | appointment_date | start_time | name   | location |
    | 2018-06-22       | 08:00:00   | Pat-45 | PAT-AT   |
    | 2018-06-23       | 10:00:00   | Pjc-54 | PJC-BT   |
