#language: pt

@br
@br_login_individual_failed
Funcionalidade: Login no modo individual cenarios Falhas
    Rotina responsável pelo testes dos diferentes tipos de login

    @br_login_individual_failed_offline_sem_lista_entrar
    Cenario: Realizar login offline sem a lista de usuarios offline - Botão ENTRAR
        Dado desativo a conexão e tento realizar o login com o usuario "mobi21002@dimep.com.br" e clico no botão "ENTRAR"
        Então deverá constar uma mensagem "Usuário não tem permissão de acesso offline" 

    @br_login_individual_failed_offline_sem_lista_marcar_ponto
    Cenario: Realizar login offline sem a lista de usuarios offline - Botão Marcar Ponto
        Dado desativo a conexão e tento realizar o login com o usuario "mobi21002@dimep.com.br" e clico no botão "Marcar Ponto"
        Então deverá constar uma mensagem "Primeiro acesso a aplicação deve ser feito pelo botão login, somente após pode ser realizado marcações por este botão" 

    @br_login_individual_failed_online_senha_incorreta
    Cenario: Realizar login online com a senha incorreta
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" senha "2" com permissão offline e clico no botão "ENTRAR"
        Então deverá constar uma mensagem "Usuário e/ou senha estão incorretos" 

    @br_login_individual_failed_offline_senha_incorreta
    Cenario: Realizar login offline com a lista de usuarios offline, com a senha incorreta
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" senha "1" com permissão offline e clico no botão "ENTRAR"
        Quando deslogo, desativo a conexão e tento realizar o login com a senha '2' e o Botão "ENTRAR"
        Então deverá constar uma mensagem "Usuário não tem permissão de acesso offline" 

    @br_login_individual_failed_inativo
    Cenario: Realizar login com usuario inativo
        Dado realizo o login com o usuario desativado "mobi21012@dimep.com.br" senha "1" e clico no botão "ENTRAR"
        Então deverá constar uma mensagem "Usuário Inativo" 