#language: pt

@md
@md_login_multiuser
@md_login_multiuser_sucess
Funcionalidade: Login no modo multiusuário
    Rotina responsável pelos testes dos diferentes tipos de login

    Contexto:
        Dado que estou na tela de login multiusuário "Login usando:" e estou "Online"

    @md_login_multiuser_sucess_online
    @md_login_multiuser_sucess_email
    Esquema do Cenario: Realizar login utilizando E-mail com o usuário <email>
        Dado seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador          | senha  | funcionario              |
            | mobi21001@madis.com.br | 1      | Pessoa0001 Facial        |
            | mobi21002@madis.com.br | 1      | Pessoa0002 Multi         |
            | mobi21003@madis.com.br | 1      | Pessoa0003 Multi         |
            | mobi21004@madis.com.br | 1      | Obriga emp)              |
            | mobi21005@madis.com.br | 1      | Pessoa0005 Multi         |
            | mobi21006@madis.com.br | 1      | Pessoa0006 Ponto         |
            | mobi21007@madis.com.br | 1      | Pessoa0007 Ponto         |
            | mobi21008@madis.com.br | 1      | Pessoa0008 Login         |
            | mobi21009@madis.com.br | 1      | Pessoa0009 um)           |
            | mobi21010@madis.com.br | 1      | Pessoa0010 marcada       |
            | mobi21011@madis.com.br | 1      | Pessoa0011               |
            | mobi21013@madis.com.br | 1      | Pessoa0013 Full          |
            | mobi21014@madis.com.br | 1      | Pessoa0014 Full          |
            | mobi21015@madis.com.br | 1      | Pessoa0015 Multi         |
            | mobi21016@madis.com.br | 1      | Pessoa0016 Multi         |
            | mobi21017@madis.com.br | 1      | Pessoa0017 Multi         |
            | mobi21018@madis.com.br | 1      | Pessoa0018 Ponto         |
            | mobi21019@madis.com.br | 1      | Pessoa0019 Br            |
            | mobi21020@madis.com.br | !xsR1p | Pessoa0020 Senha(!xsR1p) |

    @md_login_multiuser_sucess_online
    @md_login_multiuser_sucess_pis
    Esquema do Cenario: Realizar login utilizando PIS com o usuário <pis>
        Dado seleciono a opção de login "PIS"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 
        
        Exemplos:
            | identificador | senha | funcionario              |
            | 11111111116   | 1     | Pessoa0001 Facial        |
            | 11111111124   | 1     | Pessoa0002 Multi         |
            | 11111111132   | 1     | Pessoa0003 Multi         |
            | 11111111140   | 1     | Obriga emp)              |
            | 11111111159   | 1     | Pessoa0005 Multi         |
            | 49957957524   | 1     | Pessoa0015 Multi         |
            | 51228816356   | 1     | Pessoa0016 Multi         |
            | 89602919160   | 1     | Pessoa0017 Multi         |
    
    @md_login_multiuser_sucess_online
    @md_login_multiuser_sucess_cpf
    Esquema do Cenario: Realizar login utilizando CPF com o usuário <cpf>
        Dado seleciono a opção de login "CPF"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador | senha  | funcionario              |
            | 81281511854   | 1      | Pessoa0001 Facial        |
            | 23018147502   | 1      | Pessoa0002 Multi         |
            | 87545635264   | 1      | Pessoa0003 Multi         |
            | 03837836231   | 1      | Obriga emp)              |
            | 83217187520   | 1      | Pessoa0005 Multi         |
            | 24121397096   | 1      | Pessoa0015 Multi         |
            | 71945719001   | 1      | Pessoa0016 Multi         |
            | 32441192043   | 1      | Pessoa0017 Multi         |

    @md_login_multiuser_sucess_online
    @md_login_multiuser_sucess_matricula
    Esquema do Cenario: Realizar login utilizando Matrícula com o usuário <matricula>
        Dado seleciono a opção de login "Matrícula"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador | senha | funcionario              |
            | 1             | 1     | Pessoa0001 Facial        |
            | 2             | 1     | Pessoa0002 Multi         |
            | 3             | 1     | Pessoa0003 Multi         |
            | 4             | 1     | Obriga emp)              |
            | 5             | 1     | Pessoa0005 Multi         |
            | 15            | 1     | Pessoa0015 Multi         |
            | 16            | 1     | Pessoa0016 Multi         |
            | 17            | 1     | Pessoa0017 Multi         |

    @clean_app
    @md_login_multiuser_sucess_azure_ad
    Cenario: Realizar login utilizando Azure Active Directory
        Dado que na tela e multiuser clico no botão "Azure Active Directory"
        Quando realizo login com as credenciais "<identificador>" e "<senha>" no login do Azure AD
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador                                        | senha    | funcionario |
            | teste_mdcomune_br@matsantos21hotmail.onmicrosoft.com | Dimep*25 | Usuario 2   |

    @md_login_multiuser_sucess_offline
    @md_login_multiuser_sucess_offline_email
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador          | senha | funcionario              |
            | mobi21002@madis.com.br | 1     | Pessoa0002 Multi         |
            | mobi21003@madis.com.br | 1     | Pessoa0003 Multi         |
            | mobi21015@madis.com.br | 1     | Pessoa0015 Multi         |
            | mobi21016@madis.com.br | 1     | Pessoa0016 Multi         |

    @md_login_multiuser_sucess_offline
    @md_login_multiuser_sucess_offline_pis
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "PIS"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador | senha | funcionario              |
            | 11111111124   | 1     | Pessoa0002 Multi         |
            | 11111111132   | 1     | Pessoa0003 Multi         |
            | 49957957524   | 1     | Pessoa0015 Multi         |
            | 51228816356   | 1     | Pessoa0016 Multi         |

    @md_login_multiuser_sucess_offline
    @md_login_multiuser_sucess_offline_cpf
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "CPF"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador | senha  | funcionario              |
            | 23018147502   | 1      | Pessoa0002 Multi         |
            | 87545635264   | 1      | Pessoa0003 Multi         |
            | 24121397096   | 1      | Pessoa0015 Multi         |
            | 71945719001   | 1      | Pessoa0016 Multi         |

    @md_login_multiuser_sucess_offline
    @md_login_multiuser_sucess_offline_matricula
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "Matrícula"
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