#language: pt
#encoding: utf-8

Funcionalidade: Verificar o status da reserva
 Como um usuário autenticado,
 para que eu saiba se meu pedido foi aceito,
 eu gostaria de ver o status da minha solicitação

  Cenário: Aguardando confirmação de reserva
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as salas cadastradas no sistema: "<name>", "<location>"
    E existam os seguintes alugueis cadastrados no meu nome: "<appointment_date>", "<start_time>"
    E eu clicar no botão "Meus aluguéis"
    Então deve aparecer uma mensagem na tela dizendo "Aguardando confirmação"

  Cenário: Reserva confirmada
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as salas cadastradas no sistema: "<name>", "<location>"
    E existam os seguintes alugueis confirmados cadastrados no meu nome: "<appointment_date>", "<start_time>"
    E eu clicar no botão "Meus aluguéis"
    Então deve aparecer uma mensagem na tela dizendo "Confirmado"

  Cenário: Reserva rejeitada
    Dado que eu esteja logado como usuário comum com o email "usuario@comum.com" e a senha "usuario123"
    E eu esteja no página principal com caminho "/"
    E existam as salas cadastradas no sistema: "<name>", "<location>"
    E existam os seguintes alugueis rejeitados cadastrados no meu nome: "<appointment_date>", "<start_time>"
    E eu clicar no botão "Meus aluguéis"
    Então deve aparecer uma mensagem na tela dizendo "Rejeitado"
