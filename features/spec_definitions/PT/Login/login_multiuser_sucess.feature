#language: pt

@pt
@pt_login_multiuser
@pt_login_multiuser_sucess
Funcionalidade: Login no modo multiusuário
    Rotina responsável pelos testes dos diferentes tipos de login

    Contexto:
        Dado que estou na tela de login multiusuário "Login usando:" e estou "Online"

    @pt_login_multiuser_sucess_online
    @pt_login_multiuser_sucess_email
    Esquema do Cenario: Realizar login utilizando E-mail com o usuário <email>
        Dado seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador      | senha  | funcionario                 |
            | mobi21001@dimep.pt | 1      | Pessoa0001 Multi            |
            | mobi21002@dimep.pt | 1      | PESSOA0002 MULTIMARCAROF    |
            | mobi21003@dimep.pt | 1      | Pessoa0003 Multi            |
            | mobi21004@dimep.pt | 1      | Pessoa0004 Multi            |
            | mobi21005@dimep.pt | 1      | Pessoa0005 Multi            |
            | mobi21006@dimep.pt | 1      | Pessoa0006 Ponto            |
            | mobi21007@dimep.pt | 1      | Pessoa0007 Ponto            |
            | mobi21008@dimep.pt | 1      | Pessoa0008 Ponto            |
            | mobi21009@dimep.pt | 1      | Pessoa0009 Ponto            |
            | mobi21010@dimep.pt | 1      | Pessoa0010 marcada          |
            | mobi21011@dimep.pt | 1      | Pessoa0011 mobile           |
            | mobi21013@dimep.pt | 1      | Pessoa0013 Funcionario      |
            | mobi21014@dimep.pt | 1      | Pessoa0014 Gestor           |
            | mobi21015@dimep.pt | 1      | Pessoa0015 Multi            |
            | mobi21016@dimep.pt | 1      | Pessoa0016 Multi            |
            | mobi21017@dimep.pt | 1      | Pessoa0017 Multi            |
            | mobi21018@dimep.pt | 1      | Pessoa0018 Ponto            |
            | mobi21019@dimep.pt | 1      | Pessoa0019 Br               |
            | mobi21020@dimep.pt | !xsR1p | Pessoa0020 Senha(!xsR1p)    |

    
    @pt_login_multiuser_sucess_online
    @pt_login_multiuser_sucess_matricula
    Esquema do Cenario: Realizar login utilizando Matrícula com o usuário <matricula>
        Dado seleciono a opção de login "Número do funcionário"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador | senha | funcionario              |
            | 1             | 1     | Pessoa0001 Multi         |
            | 2             | 1     | PESSOA0002 MULTIMARCAROF |
            | 3             | 1     | Pessoa0003 Multi         |
            | 4             | 1     | Pessoa0004 Multi         |
            | 5             | 1     | Pessoa0005 Multi         |
            | 15            | 1     | Pessoa0015 Multi         |
            | 16            | 1     | Pessoa0016 Multi         |
            | 17            | 1     | Pessoa0017 Multi         |

    @clean_app
    @pt_login_multiuser_sucess_azure_ad
    Cenario: Realizar login utilizando Azure Active Directory
        Dado que na tela e multiuser clico no botão "Azure Active Directory"
        Quando realizo login com as credenciais "<identificador>" e "<senha>" no login do Azure AD
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador                                        | senha    | funcionario |
            | teste_kairos_pt@matsantos21hotmail.onmicrosoft.com   | Dimep*25 | Usuario PT  |

    @pt_login_multiuser_sucess_offline
    @pt_login_multiuser_sucess_offline_email
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador      | senha | funcionario              |
            | mobi21002@dimep.pt | 1     | Pessoa0002 Multi         |
            | mobi21003@dimep.pt | 1     | Pessoa0003 Multi         |
            | mobi21015@dimep.pt | 1     | Pessoa0015 Multi         |
            | mobi21016@dimep.pt | 1     | Pessoa0016 Multi         |

    @pt_login_multiuser_sucess_offline
    @pt_login_multiuser_sucess_offline_matrciula
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "Número do funcionário"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador | senha | funcionario              |
            | 2             | 1     | Pessoa0002 Multi         |
            | 3             | 1     | Pessoa0003 Multi         |
            | 15            | 1     | Pessoa0015 Multi         |
            | 16            | 1     | Pessoa0016 Multi         |