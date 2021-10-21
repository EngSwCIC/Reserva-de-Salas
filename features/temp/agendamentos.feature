#language: pt

Funcionalidade: Eu, como administrador, estando na página "Salas Existentes", gostaria de poder clicar no nome de uma sala para conseguir ver seus agendamentos atuais e passados com o intuito de tomar decisões administrativas.
    # Pontuação da história: 3 pontos

    # Essa história de usuário é SMART, visto que ela é:
    # S : Específica, pois obedece ao padrão de: dada uma condição específica (estar na página "Salas Existentes"), é realizada uma ação específica (clicar no nome da sala), para que então algo específico aconteça (mostrar os agendamentos atuais e passados da sala).
    # M : Mensurável, pois é testável. Basta clicar na tela e comparar as informações mostradas com as presentes no caso de teste.
    # A : Alcançável em apenas uma iteração, principalmente devido a complexidade a ela atribuída (3 pontos).
    # R : Relevante pois:
    #   1) Por que ver agendamentos atuais e passados? Tomar decisões administrativas como definir horários de limpeza.
    #   2) Por que tomar decisões administrativas? Identificar necessidades dos frequentadores.
    #   3) Por que identificar necessidades dos frequentadores? Para prestar um melhor serviço.
    #   4) Por que prestar um serviço melhor? Melhorar a qualidade de ensino da instituição.
    #   5) Por que melhorar a qualidade de ensino da instituição? Melhorar o futuro da nação.
    # T : Cronometrado, pois possui 3 pontos no Tracker. Caso a dificuldade se demonstre maior do que a esperada, é possível dividir a feature em dois ciclos: um para exibir os agendamentos atuais e outro para os passados.

    Contexto:  
        Dado que o banco possui ao menos uma sala cadastrada
        E que o usuário esteja logado como administrador
        E que o usuário esteja na página "Salas Existentes"
        
    
    # Caminho Feliz
    Cenário: Ver agendamentos atuais de uma sala
        Quando eu clicar no nome da sala 
        Então eu devo ser redirecionado para a página da sala
        Dado que a sala possua um agendamento às "10" horas para daqui a "7" dias a contar do dia de hoje
        E que a sala possua um agendamento às "12" horas para daqui a "15" dias a contar do dia de hoje
        Quando eu clicar em "Agendamentos"
        Então eu devo ver uma lista que contenha esses dois agendamentos

    Cenário: Ver histórico de agendamentos de uma sala
        Quando eu clicar no nome da sala 
        Então eu devo ser redirecionado para a página da sala
        Dado que a sala possua um agendamento às "10" horas há "7" dias
        E que a sala possua um agendamento às "12" horas há "6" dias
        Quando eu clicar em "Histórico"
        Então eu devo ver uma lista que contenha esses dois agendamentos

    # Caminho Triste
    Cenário: Acessar as informações de uma sala 
        Quando eu manualmente digitar a URL no navegador para acessar a página de uma sala
        E não existir um registro correspondente a URL
        Então eu devo ser redirecionado para página "Salas Existentes" e informado do erro.