#language: pt

@mx
@mx_login_multiuser
@mx_login_multiuser_sucess
Funcionalidade: Login no modo multiusuário
    Rotina responsável pelos testes dos diferentes tipos de login

    Contexto:
        Dado que estou na tela de login multiusuário "Inicie sesión usando:" e estou "Online"

    @mx_login_multiuser_sucess_online
    @mx_login_multiuser_sucess_email
    Esquema do Cenario: Realizar login utilizando E-mail com o usuário <email>
        Dado seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Iniciar sesión"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Salir de la aplicación" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador      | senha  | funcionario        |
            | mobi21001@dimep.mx | 1      | Pessoa0001 Multi   |
            | mobi21002@dimep.mx | 1      | Pessoa0002 Multi   |
            | mobi21003@dimep.mx | 1      | Pessoa0003 Multi   |
            | mobi21004@dimep.mx | 1      | Pessoa0004 Multi   |
            | mobi21005@dimep.mx | 1      | Pessoa0005 Multi   |
            | mobi21006@dimep.mx | 1      | Pessoa0006 Ponto   |
            | mobi21007@dimep.mx | 1      | Pessoa0007 Ponto   |
            | mobi21008@dimep.mx | 1      | Pessoa0008 Login   |
            | mobi21009@dimep.mx | 1      | Pessoa0009 um)     |
            | mobi21010@dimep.mx | 1      | Pessoa0010 marcada |
            | mobi21011@dimep.mx | 1      | Pessoa0011 Pedidos |
            | mobi21013@dimep.mx | 1      | Pessoa0013 Full    |
            | mobi21014@dimep.mx | 1      | Pessoa0014 Full    |
            | mobi21015@dimep.mx | 1      | Pessoa0015 Multi   |
            | mobi21016@dimep.mx | 1      | Pessoa0016 Multi   |
            | mobi21017@dimep.mx | 1      | Pessoa0017 Multi   |
            | mobi21018@dimep.mx | 1      | Pessoa0018 Ponto   |
            | mobi21020@dimep.mx | !xsR1p | Usuario Especial   |

    @mx_login_multiuser_sucess_online
    @mx_login_multiuser_sucess_registro
    Esquema do Cenario: Realizar login utilizando Registro com o usuário <matricula>
        Dado seleciono a opção de login "Registro"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Iniciar sesión"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Salir de la aplicación" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador | senha | funcionario      |
            | 1             | 1     | Pessoa0001 Multi |
            | 2             | 1     | Pessoa0002 Multi |
            | 3             | 1     | Pessoa0003 Multi |
            | 4             | 1     | Pessoa0004 Multi |
            | 5             | 1     | Pessoa0005 Multi |
            | 15            | 1     | Pessoa0015 Multi |
            | 16            | 1     | Pessoa0016 Multi |
            | 17            | 1     | Pessoa0017 Multi |

    @clean_app
    @mx_login_multiuser_sucess_azure_ad
    Cenario: Realizar login utilizando Azure Active Directory
        Dado que na tela e multiuser clico no botão "Azure Active Directory"
        Quando realizo login com as credenciais "<identificador>" e "<senha>" no login do Azure AD
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Salir de la aplicación" para retornar a tela de login multiusuário

        Exemplos:
            | identificador                                      | senha    | funcionario |
            | teste_kairos_mx@matsantos21hotmail.onmicrosoft.com | Dimep*25 | Usuario MX  |

    @mx_login_multiuser_sucess_offline
    @mx_login_multiuser_sucess_offline_email
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Iniciar sesión"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Salir de la aplicación" para retornar a tela de login multiusuário

        Exemplos:
            | identificador      | senha | funcionario      |
            | mobi21002@dimep.mx | 1     | Pessoa0002 Multi |
            | mobi21003@dimep.mx | 1     | Pessoa0003 Multi |
            | mobi21015@dimep.mx | 1     | Pessoa0015 Multi |
            | mobi21016@dimep.mx | 1     | Pessoa0016 Multi |

    @mx_login_multiuser_sucess_offline
    @mx_login_multiuser_sucess_offline_registro
    Cenario: Realizar relogin offline utilizando Registro sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "Registro"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Iniciar sesión"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Salir de la aplicación" para retornar a tela de login multiusuário

        Exemplos:
            | identificador | senha | funcionario      |
            | 2             | 1     | Pessoa0002 Multi |
            | 3             | 1     | Pessoa0003 Multi |
            | 15            | 1     | Pessoa0015 Multi |
            | 16            | 1     | Pessoa0016 Multi |