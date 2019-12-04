#language: pt
#encoding: utf-8

Funcionalidade: Verificar o status da reserva
 Como um usuário autenticado,
 para que eu saiba se meu pedido foi aceito,
 eu gostaria de ver o status da minha solicitação

  Cenário: Reserva solicitada
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    E eu clicar no botão "Meus aluguéis"
    Então eu devo estar em uma página com uma tabela com os dados:
    | # | |
    | Appointment Date | |
    |Start Time | |