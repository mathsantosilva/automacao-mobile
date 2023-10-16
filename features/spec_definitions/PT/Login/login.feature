#language: pt

@PT
@PT_login
Funcionalidade: Login no app mobile
    Rotina responsável pelo testes dos diferentes tipos de login
    
    # Contexto: Acessando a tela de cadastro de empresas
    #     Dado que acesso a tela de login em "Dimep/Account/LogOn" no ambiente PT
    #     Então vou até a tela de empresas para cadastrar uma nova empresa 

    @PT_login_email_dash
    Cenario: Login utilizando email e senha
        Dado que preencho o email "mobi21002@dimep.pt" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo PT
        Quando for direcionado para a dashboard e apresentar o nome do funcionario "Pessoa0002 Multi" do ambiente PT e clicar no relogio
        Quando clicar em marcar ponto no aplicativo PT
        Então deverá apresentar a mensagem "PONTO MARCADO COM SUCESSO" em portugues-pt 

    @PT_login_email_marc
    Cenario: Login utilizando email e senha tela de marcação
        Dado que preencho o email "mobi21002@dimep.pt" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo PT
        Quando estiver no dashboard em portugues-pt clico no menu e e deslogo do app
        Quando clico no botão em portugues-pt "Marcar punto"
        Quando clicar em marcar ponto no aplicativo PT
        Então deverá apresentar a mensagem "PONTO MARCADO COM SUCESSO" em portugues-pt

    @PT_login_multiuser
    Cenario: Login utilizando utilizando multiuser
        Dado realizo o login com o email "teste12452@dimep.pt" e  a senha "1" master e clico em "ENTRAR" no aplicativo PT
        Quando estiver no dashboard clico no menu e vou na opção em portugues-pt "CONFIGURAÇÃO MÚLTIPLO UTLIZADOR" 
        Quando habilito a opção "Habilitar modo de múltiplo utilizador" e seleciono a empresa e filial do ambiente PT
            |Empresa|Testes mobile - 23-02-22 - 1143|
        Quando clico em "SALVAR", fecho a mensagem de sucesso "Configuração guardada com sucesso Sincronização terminada" em portugues-pt e deslogo 
        Então devo conseguir realizar login com a opção NÚMERO DO FUNCIONÁRIO, utilizando a senha "1", clicar em "ENTRAR" e receber a mensagem de sucesso ao marcar ponto "PONTO MARCADO COM SUCESSO"
            |NÚMERO DO FUNCIONÁRIO|2|

    @PT_login_azure_cert
    Cenario: Login utilizando azure certificado
        Dado que clico no botão Entrar com azure AD no aplicativo PT
        Quando preencho o email "teste_kairos_qcdev_PT@matsantos21hotmail.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente PT
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "usuario PT" e marcar ponto demonstrando a mensagem "PONTO MARCADO COM SUCESSO" em portugues-pt

    @PT_login_azure_ad
    Cenario: Login utilizando azure ad
        Dado que clico no botão Entrar com azure AD no aplicativo PT
        Quando preencho o email "2019@testexpto.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente PT
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Pessoa0031 Ad" e marcar ponto demonstrando a mensagem "PONTO MARCADO COM SUCESSO" em portugues-pt