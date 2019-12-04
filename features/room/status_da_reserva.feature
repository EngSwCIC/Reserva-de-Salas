#language: pt
#encoding: utf-8

Funcionalidade: Verificar o status da reserva
 Como um usuário autenticado,
 para que eu saiba se meu pedido foi aceito,
 eu gostaria de ver o status da minha solicitação

  Cenário: Nenhuma reserva
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as seguintes salas cadastradas no sistema:
      |name  | Pat-45 |
      |location| PAT-AT |
    E eu clicar no botão "Meus aluguéis"
    Então deve aparecer uma mensagem na tela dizendo "Status"

  Cenário: Aguardando confirmação de reserva
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
    E eu esteja no página principal com caminho "/"
    E eu clicar no botão "Meus aluguéis"
    Então deve aparecer uma mensagem na tela dizendo "Aguardando confirmação"
