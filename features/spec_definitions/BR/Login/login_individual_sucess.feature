#language: pt

@br
@br_login_individual_sucess
Funcionalidade: Login no modo individual
    Rotina responsável pelo testes dos diferentes tipos de login

    @br_login_individual_sucess_offline_not_closed_app
    Cenario: Realizar Relogin offline sem fechar o app
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" com permissão offline e clico no botão "ENTRAR"
        Quando deslogo e desativo a internet do dispositivo
        Então devo conseguir logar normalmente com o botão "ENTRAR" e visualizar o nome do funcionario "Pessoa0002 Multi"

    @br_login_individual_sucess_offline_closed_app
    Cenario: Realizar Relogin offline fechando o app
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" com permissão offline e clico no botão "ENTRAR"
        Quando deslogo e desativo a internet do dispositivo
        Quando encerro o app e abro novamente 
        Então devo conseguir logar normalmente com o botão "ENTRAR" e visualizar o nome do funcionario "Pessoa0002 Multi"

    @br_login_individual_sucess_lembrar_senha_not_closed_app
    Cenario: Realizar login usando a senha salva
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" senha "1", clico em "LEMBRAR SENHA?" e em "ENTRAR"
        Quando deslogo e tento logar com a senha salva clicando em "ENTRAR"
        Então devo conseguir visualizar o nome do funcionario "Pessoa0002 Multi"

    @br_login_individual_sucess_lembrar_senha_closed_app
    Cenario: Realizar login usando a senha salva
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" senha "1", clico em "LEMBRAR SENHA?" e em "ENTRAR"
        Quando deslogo, finalizo o app e inicio novamente
        Quando tento logar com a senha salva clicando em "ENTRAR"
        Então devo conseguir visualizar o nome do funcionario "Pessoa0002 Multi"

    @br_login_individual_sucess_inativo
    Cenario: Realizar login usando a senha salva
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" senha "1", clico em "LEMBRAR SENHA?" e em "ENTRAR"
        Quando deslogo, finalizo o app e inicio novamente
        Quando tento logar com a senha salva clicando em "ENTRAR"
        Então devo conseguir visualizar o nome do funcionario "Pessoa0002 Multi"

    @br_login_individual_sucess_recuperar_senha
    Cenario: Realiza a recuperação de senha
        Dado que clico em "ESQUECI?" e insiro o email "mobi21002@dimep.com.br" e clico em "RECUPERAR"
        Então Devera constar a mensagem de recuperação "FORAM ENVIADAS PARA O SEU EMAIL (mobi21002@dimep.com.br) AS INSTRUÇÕES PARA RECUPERAR A SUA SENHA"

    @br_login_individual_sucess_azure_cert
    Cenario: Realizar login usando azure certificado
        Dado que clico no botão "Entrar com Azure AD"
        Quando preencho o email "teste_kairos_br@matsantos21hotmail.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente BR
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Usuario Cert" 

    @br_login_individual_sucess_azure_ad
    Cenario: Realizar login usando azure ad
        Dado que clico no botão "Entrar com Azure AD"
        Quando preencho o email "usuarioazurebr@matsantos21hotmail.onmicrosoft.com" e senha "Dimep*26" e clico em entrar na microsoft enterprise do ambiente BR
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Usuario AD" 

    @br_login_individual_sucess_bt_marcar_ponto
    Cenario: Realizar login utilizando o botão "Marcar Ponto"
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" com permissão offline e clico no botão "ENTRAR"
        Quando deslogo e insiro a senha novamente e clico em "Marcar Ponto"
        Então devo conseguir visualizar a tela "MARCAR PONTO" e nome do funcionario "Pessoa0002 Multi"

    @br_login_individual_sucess_senha_caracter_especial
    Cenario: Realizar login utilizando usuario com senha utilizando caracter especial
        Dado realizo o login com o usuario "mobi21020@dimep.com.br" senha "!xsR1p" e clico no botão "ENTRAR"
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Usuario Especial" 