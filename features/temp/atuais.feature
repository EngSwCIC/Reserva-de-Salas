#language: pt
Funcionalidade: Eu como administrador gostaria de ver todos os agendamentos atuais na plataforma para que eu possa saber quais salas costumam ser as mais reservadas de modo a descobrir quais características mais interessam aos usuários.

    # cenário feliz
    Cenário: Ver histórico de agendamento
        Dado que o banco possui ao menos um registro de agendamento passado
        E que o usuário esteja logado como administrador
        E que o usuário esteja na página de "back-office"
        Quando eu clicar em "Histórico" 
        Então eu devo ser redirecionado para a página de "Histórico"
        E eu devo ver uma lista com todos os agendamentos passados.