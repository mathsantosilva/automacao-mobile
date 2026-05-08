#language: pt

@br
@br_login_multiuser
@br_login_multiuser_sucess
Funcionalidade: Login no modo multiusuário
    Rotina responsável pelos testes dos diferentes tipos de login

    Contexto:
        Dado que estou na tela de login multiusuário "Login usando:" e estou "Online"

    @br_login_multiuser_sucess_online
    @br_login_multiuser_sucess_email
    Esquema do Cenario: Realizar login utilizando E-mail com o usuário <email>
        Dado seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
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

    @br_login_multiuser_sucess_online
    @br_login_multiuser_sucess_pis
    Esquema do Cenario: Realizar login utilizando PIS com o usuário <pis>
        Dado seleciono a opção de login "PIS"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 
        
        Exemplos:
            | identificador | senha | funcionario              |
            | 11111111116   | 1     | Pessoa0001 Multi         |
            | 14733196454   | 1     | Pessoa0002 Multi         |
            | 11111111132   | 1     | Pessoa0003 Multi         |
            | 11111111140   | 1     | Pessoa0004 Multi         |
            | 11111111159   | 1     | Pessoa0005 Multi         |
            | 70035700042   | 1     | Pessoa0015 Multi         |
            | 42881046081   | 1     | Pessoa0016 Multi         |
            | 82620642976   | 1     | Pessoa0017 Multi         |
    
    @br_login_multiuser_sucess_online
    @br_login_multiuser_sucess_cpf
    Esquema do Cenario: Realizar login utilizando CPF com o usuário <cpf>
        Dado seleciono a opção de login "CPF"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador | senha  | funcionario              |
            | 81281511854   | 1      | Pessoa0001 Multi         |
            | 21028546637   | 1      | Pessoa0002 Multi         |
            | 87545635264   | 1      | Pessoa0003 Multi         |
            | 03837836231   | 1      | Pessoa0004 Multi         |
            | 83217187520   | 1      | Pessoa0005 Multi         |
            | 56477927071   | 1      | Pessoa0015 Multi         |
            | 34720381014   | 1      | Pessoa0016 Multi         |
            | 32441192043   | 1      | Pessoa0017 Multi         |

    @br_login_multiuser_sucess_online
    @br_login_multiuser_sucess_matricula
    Esquema do Cenario: Realizar login utilizando Matrícula com o usuário <matricula>
        Dado seleciono a opção de login "Matrícula"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário 

        Exemplos:
            | identificador | senha | funcionario              |
            | 1             | 1     | Pessoa0001 Multi         |
            | 2             | 1     | Pessoa0002 Multi         |
            | 3             | 1     | Pessoa0003 Multi         |
            | 4             | 1     | Pessoa0004 Multi         |
            | 5             | 1     | Pessoa0005 Multi         |
            | 15            | 1     | Pessoa0015 Multi         |
            | 16            | 1     | Pessoa0016 Multi         |
            | 17            | 1     | Pessoa0017 Multi         |

    @clean_app
    @br_login_multiuser_sucess_azure_ad
    Cenario: Realizar login utilizando Azure Active Directory
        Dado que na tela e multiuser clico no botão "Azure Active Directory"
        Quando realizo login com as credenciais "<identificador>" e "<senha>" no login do Azure AD
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador                                               | senha    | funcionario |
            | teste_kairos_producao_br@matsantos21hotmail.onmicrosoft.com | Dimep*26 | teste br    |

    @br_login_multiuser_sucess_offline
    @br_login_multiuser_sucess_offline_email
    Cenario: Realizar relogin offline sem fechar o app
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo acessar o aplicativo com sucesso e visualizar o nome do funcionario "<funcionario>"
        E realizo o logout pelo botão "Sair da Aplicação" para retornar a tela de login multiusuário

        Exemplos:
            | identificador          | senha | funcionario              |
            | mobi21002@dimep.com.br | 1     | Pessoa0002 Multi         |
            | mobi21003@dimep.com.br | 1     | Pessoa0003 Multi         |
            | mobi21015@dimep.com.br | 1     | Pessoa0015 Multi         |
            | mobi21016@dimep.com.br | 1     | Pessoa0016 Multi         |

    @br_login_multiuser_sucess_offline
    @br_login_multiuser_sucess_offline_pis
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
            | 14733196454   | 1     | Pessoa0002 Multi         |
            | 11111111132   | 1     | Pessoa0003 Multi         |
            | 70035700042   | 1     | Pessoa0015 Multi         |
            | 42881046081   | 1     | Pessoa0016 Multi         |

    @br_login_multiuser_sucess_offline
    @br_login_multiuser_sucess_offline_cpf
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
            | 21028546637   | 1      | Pessoa0002 Multi         |
            | 87545635264   | 1      | Pessoa0003 Multi         |
            | 56477927071   | 1      | Pessoa0015 Multi         |
            | 34720381014   | 1      | Pessoa0016 Multi         |

    @br_login_multiuser_sucess_offline
    @br_login_multiuser_sucess_offline_matricula
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