#language: pt
Funcionalidade: Eu como usuário (normal/admin) gostaria de, ao efetuar o login, ser redirecionado ao backoffice para que eu de fato possa utilizar os recursos do site como ver a listagem de salas.
    # Pontuação da história: 1 ponto

    # Essa história de usuário é SMART, visto que ela é:
    # S : Específica, pois obedece ao padrão de: dada uma condição específica (ter realizado o login), é realizada uma ação específica (ser redirecionado a página de backoffice) para que então algo específico aconteça (ser capaz de utilizar os recursos do site como acessar a listagem de salas).
    # M : Mensurável pois é testável. Basta verificar se a página para a qual o usuário foi redirecionado é de fato a página de backoffice.
    # A : Alcançável em apenas uma iteração, principalmente devido a complexidade a ela atribuída (1 ponto).
    # R : Relevante pois: 
    #   1) Por que ser redirecionado para a página de backoffice? Ser capaz de acessar rapidamente (menos cliques) recursos do site como ver a listagem de salas.
    #   2) Por que ser capaz de acessar os recursos do site rapidamente (com menos cliques)? Melhorar a qualidade de vida do usuário.
    #   3) Por que melhorar a qualidade de vida do usuário? Para que ele não perca tempo com detalhes e possa utilizar melhor o seu tempo.
    #   4) Por que é importante que o usuário possa utilizar melhor o seu tempo? Para que ele tenha mais tempo para planejar o uso da sala.
    #   5) Por que é importante que o usuário tenha mais tempo para planejar o uso da sala? Para que a reunião seja produtiva e ele volte a utilizar o serviço.
    # T : Cronometrado, pois possui apenas 1 ponto no Tracker visto que basta modificar a path para a qual o redirecionamento já existe.

    # Caminho Feliz
    Cenário: Ter acesso aos recursos do backoffice
        Dado que o usuário acabou de efetuar o login
        Então ele deve ser redirecionado à página de backoffice 
        E consegue ter acesso aos recursos desejados, como a listagem de salas.

    # Caminho Triste
    Cenário: Ter acesso aos recursos do backoffice
        Dado que o usuário efetuou o login utilizando credenciais inválidas
        Então ele deve permanecer na página de login
        E deve ser avisado de que as credenciais são inválidas.

    