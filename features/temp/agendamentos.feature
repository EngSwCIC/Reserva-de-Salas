#language: pt
Funcionalidade: Eu, como administrador, gostaria de poder clicar no nome de uma sala para conseguir ver seus agendamentos atuais e passados.

    # cenário feliz

    Cenário de fundo: 
        Dado que o banco possui ao menos uma sala cadastrada
        E que o usuário esteja logado como administrador
        E que o usuário esteja na página "Salas Existentes"
        Quando eu clicar no nome da sala 
        Então eu devo ser redirecionado para a página da sala
    
    Cenário: Ver agendamentos atuais de uma sala
        Quando eu clicar em "Agendamentos"
        Então eu devo ver a lista com todos os agendamentos atuais da sala em questão

    Cenário: Ver histórico de agendamentos de uma sala
        Quando eu clicar em "Histórico de Agendamentos"
        Então eu devo ver a lista com todos os agendamentos passados da sala em questão

    Cenário: Acessar as informações de uma sala 
        Dado que o banco possui ao menos uma sala cadastrada
        E que o usuário esteja logado como administrador
        E que o usuário esteja na página "Salas Existentes"
        Quando eu manualmente digitar a URL no navegador para acessar a página de uma sala
        E não existir um registro correspondente a URL
        Então eu devo ser redirecionado para uma página que informe ao usuário que a sala em questão não existe.

    

    