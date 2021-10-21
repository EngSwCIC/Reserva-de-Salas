#language: pt
Funcionalidade: Eu como usuário (normal/admin) gostaria de, ao efetuar o login, ser redirecionado ao backoffice para que eu de fato possa utilizar os recursos do site como ver a listagem de salas.
    
    Cenário: Ter acesso aos recursos do backoffice
        Dado que o usuário acabou de efetuar o login
        Então ele deve ser redirecionado à página de backoffice 
        E consegue ter acesso aos recursos desejados, como a listagem de salas.

    Cenário: Ter acesso aos recursos do backoffice
        Dado que o usuário efetuou o login utilizando credenciais inválidas
        Então ele deve permanecer na página de login
        E deve ser avisado de que as credenciais são inválidas.

    