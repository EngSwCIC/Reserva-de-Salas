#language: pt
Funcionalidade: Eu como usuário (normal/admin) gostaria de, ao efetuar o login, ser redirecionado ao backoffice para que eu de fato possa utilizar os recursos do site ao invés de simplesmente uma tela de boas vindas.

    # cenário feliz
    Cenário: Ter acesso aos recursos do backoffice
        Dado que o usuário acabou de efetuar o login
        Então ele deve ser redirecionado a página de backoffice 
        E consegue ter acesso aos recursos desejados.

    