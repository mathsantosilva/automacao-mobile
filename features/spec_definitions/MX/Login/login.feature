#language: pt

@mx
@mx_login
Funcionalidade: Login no app mobile
    Rotina responsável pelo testes dos diferentes tipos de login
    
    @mx_login_email_dash
    Cenario: Login utilizando email e senha
        Dado que preencho o email "mobi21001@dimep.mx" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo MX
        Quando for direcionado para a dashboard e apresentar o nome do funcionario "Pessoa0001 Multi" do ambiente MX e clicar no relogio
        Quando clicar em marcar ponto no aplicativo MX
        Então deverá apresentar a mensagem "PUNTO MARCADO CON ÉXITO" em espanhol 

    @mx_login_email_marc
    Cenario: Login utilizando email e senha tela de marcação
        Dado que preencho o email "mobi21003@dimep.mx" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo MX
        Quando estiver no dashboard em espanhol clico no menu e e deslogo do app
        Quando clico no botão em espanhol "Marcar punto"
        Quando clicar em marcar ponto no aplicativo MX deverá receber a mensagem "PUNTO MARCADO CON ÉXITO" e ficar com a quantidade de "1" marcações por enviar
        Então deverá contem uma marcação "Pendente", clicando em sincronizar deverá informar "Sincronização terminada" e o status de "Sucesso" no envio para o sistema MX

    @mx_login_multiuser
    Cenario: Login utilizando utilizando multiuser
        Dado realizo o login com o email "teste15642@dimep.mx" e  a senha "1" master e clico em "ENTRAR" no aplicativo MX
        Quando estiver no dashboard clico no menu e vou na opção em espanhol "CONFIGURACIÓN MÚLTIPLE USUARIO" 
        Quando habilito a opção "Habilitar modo multiusuario" e seleciono a empresa e filial do ambiente MX
            |Empresa|Testes mobile - 23-02-22 - 1143|
        Quando clico em "GUARDAR", fecho a mensagem de sucesso "Configuración guardada con éxito Sincronización terminada" em espanhol e deslogo 
        Então devo conseguir realizar login no ambiente MX com a opção Registro, utilizando a senha "1", clicar em "ENTRAR" e receber a mensagem de sucesso ao marcar ponto "PUNTO MARCADO CON ÉXITO"
            |REGISTRO|2|

    @mx_login_azure_cert
    Cenario: Login utilizando azure certificado
        Dado que clico no botão Entrar com azure AD no aplicativo MX
        Quando preencho o email "teste_kairos_mx@matsantos21hotmail.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente MX
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Usuario MX" e marcar ponto demonstrando a mensagem "PUNTO MARCADO CON ÉXITO" em espanhol

    @mx_login_azure_ad
    Cenario: Login utilizando azure ad
        Dado que clico no botão Entrar com azure AD no aplicativo MX
        Quando preencho o email "2030@testexpto.onmicrosoft.com	" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente MX
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Pessoa0031 Ad" e marcar ponto demonstrando a mensagem "PUNTO MARCADO CON ÉXITO" em espanhol