#language: pt

@br
@br_login_individual_sucess
Funcionalidade: Login no modo individual
    Rotina responsável pelo testes dos diferentes tipos de login

    Contexto:
        Dado que estou na tela de login individual sem o campo "Login usando:" e estou "Online"

    @br_login_individual_sucess_online
    Esquema do Cenario: Realizar login utilizando E-mail com o usuário <email>
        Dado informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador          | senha  | funcionario              |
            | mobi21001@dimep.com.br | 1      | Pessoa0001 Multi         |
            | mobi21002@dimep.com.br | 1      | Pessoa0002 Multi         |
            | mobi21003@dimep.com.br | 1      | Pessoa0003 Multi         |
            | mobi21004@dimep.com.br | 1      | Pessoa0004 Multi         |
            | mobi21005@dimep.com.br | 1      | Pessoa0005 Multi         |
            | mobi21006@dimep.com.br | 1      | Pessoa0006 Ponto         |
            | mobi21007@dimep.com.br | 1      | Pessoa0007 Ponto         |
            | mobi21008@dimep.com.br | 1      | Pessoa0008 Login         |
            | mobi21009@dimep.com.br | 1      | Pessoa0009 um)           |
            | mobi21010@dimep.com.br | 1      | Pessoa0010 marcada       |
            | mobi21011@dimep.com.br | 1      | Pedidos mobile           |
            | mobi21013@dimep.com.br | 1      | Pessoa0013 Full          |
            | mobi21014@dimep.com.br | 1      | Pessoa0014 Gestor        |
            | mobi21015@dimep.com.br | 1      | Pessoa0015 Multi         |
            | mobi21016@dimep.com.br | 1      | Pessoa0016 Multi         |
            | mobi21017@dimep.com.br | 1      | Pessoa0017 Multi         |
            | mobi21018@dimep.com.br | 1      | Pessoa0018 Ponto         |
            | mobi21019@dimep.com.br | 1      | Pessoa0019 Br            |
            | mobi21020@dimep.com.br | !xsR1p | Usuario Especial         |

    @br_login_individual_sucess_online_marcar_ponto
    Esquema do Cenario: Realizar login utilizando E-mail com o usuário <email>
        Dado informo o identificador "<identificador>"
        E informo a senha "<senha>"
        E clico no botão "Entrar"
        E devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Marcar Ponto"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do "<funcionario>" e clica em "Fechar" para retornar a tela de login

        Exemplos:
            | identificador          | senha  | funcionario              |
            | mobi21001@dimep.com.br | 1      | Pessoa0001 Multi         |
            | mobi21002@dimep.com.br | 1      | Pessoa0002 Multi         |
            | mobi21003@dimep.com.br | 1      | Pessoa0003 Multi         |
            | mobi21004@dimep.com.br | 1      | Pessoa0004 Multi         |
            | mobi21005@dimep.com.br | 1      | Pessoa0005 Multi         |
            | mobi21006@dimep.com.br | 1      | Pessoa0006 Ponto         |
            | mobi21007@dimep.com.br | 1      | Pessoa0007 Ponto         |
            | mobi21008@dimep.com.br | 1      | Pessoa0008 Login         |
            | mobi21009@dimep.com.br | 1      | Pessoa0009 um)           |
            | mobi21010@dimep.com.br | 1      | Pessoa0010 marcada       |
            | mobi21011@dimep.com.br | 1      | Pedidos mobile           |
            | mobi21013@dimep.com.br | 1      | Pessoa0013 Full          |
            | mobi21014@dimep.com.br | 1      | Pessoa0014 Gestor        |
            | mobi21015@dimep.com.br | 1      | Pessoa0015 Multi         |
            | mobi21016@dimep.com.br | 1      | Pessoa0016 Multi         |
            | mobi21017@dimep.com.br | 1      | Pessoa0017 Multi         |
            | mobi21018@dimep.com.br | 1      | Pessoa0018 Ponto         |
            | mobi21019@dimep.com.br | 1      | Pessoa0019 Br            |
            | mobi21020@dimep.com.br | !xsR1p | Usuario Especial         |

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