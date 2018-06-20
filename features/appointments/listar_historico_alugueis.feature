#language: pt
#encoding: UTF-8
Funcionalidade: listar_historico_alugueis
  Como Usuário autenticado
  Para que eu organize os status dos meus aluguéis
  Eu quero visualizá-los em um dashboard
  
    Esquema do Cenario: Lista de Alugueis aparece adequadamente
      Dado que eu esteja logado como usuário comum com o email "xela@email.com" e a senha "123123"
      E eu esteja no página principal com caminho "/"
      E existam as salas cadastradas no sistema: "<name>", "<location>"
      E existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
      Quando eu clicar no botão "Ver Alugueis"
      Então eu devo estar em uma página com uma tabela com os dados "<appointment_date>", "<start_time>"
      Exemplos:
      |appointment_date| start_time | name   | location |
      | 2018-06-22     | 08:00:00   | Pat-45 | PAT-AT   |
      | 2018-06-23     | 10:00:00   | Pjc-54 | PJC-BT   |