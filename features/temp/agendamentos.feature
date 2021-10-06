#language: pt

Funcionalidade: Eu, como administrador, estando na página "Salas Existentes", gostaria de poder clicar no nome de uma sala para conseguir ver seus agendamentos atuais e passados com o intuito de tomar decisões administrativas.

    # Essa história de usuário é SMART pois:
    # S : Específica pois obedece o padrão de: dada uma condição específica (estar na página "Salas Existentes", é realizada uma ação específica (clicar no nome da sala) para que então algo específico aconteça (mostrar o os agendamentos atuais e passados da sala).
    # M : Mensurável pois é testável. Basta clicar na tela e comparar as informações mostradas com as presentes no caso de teste.
    # A : Alcançavel em apenas uma iteração, principal devido a complexidade a ela atribuída (3 pontos).
    # R : 
    #   1) Por que ver agendamentos atuais e passados? Tomar decisões administrativas como definir horários de limpeza.
    #   2) Por que tomar decisões administrativas? Identificar necessidades dos frequentadores.
    #   3) Por que Identificar necessidades dos frequentadores? Para prestar um melhor serviço.
    #   4) Por que prestar um serviço melhor? Melhorar a qualidade de ensino da instituição.
    #   5) Por que melhorar a qualidade de ensino da instituição? Melhorar o futuro da nação.
    # T : Cronometrado, pois possui 3 pontos no Tracker. Caso a dificuldade se demonstre maior do que a esperada, é possível separar o problema em mostrar os agendamentos atuais em um ciclo e os passados em um segundo ciclo.


    Cenário de fundo: 
        Dado que o banco possui ao menos uma sala cadastrada
        E que o usuário esteja logado como administrador
        E que o usuário esteja na página "Salas Existentes"
        Quando eu clicar no nome da sala 
        Então eu devo ser redirecionado para a página da sala
    
    # Caminho Feliz
    Cenário: Ver agendamentos atuais de uma sala
        Quando eu clicar em "Agendamentos"
        Então eu devo ver a lista com todos os agendamentos atuais da sala em questão

    Cenário: Ver histórico de agendamentos de uma sala
        Quando eu clicar em "Histórico de Agendamentos"
        Então eu devo ver a lista com todos os agendamentos passados da sala em questão

    # Caminho Triste
    Cenário: Acessar as informações de uma sala 
        Dado que o banco possui ao menos uma sala cadastrada
        E que o usuário esteja logado como administrador
        E que o usuário esteja na página "Salas Existentes"
        Quando eu manualmente digitar a URL no navegador para acessar a página de uma sala
        E não existir um registro correspondente a URL
        Então eu devo ser redirecionado para uma página que informe ao usuário que a sala em questão não existe.

    

    