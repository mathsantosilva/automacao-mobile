#language: pt

@md
@md_login
Funcionalidade: Login no app mobile
    Rotina responsável pelo testes dos diferentes tipos de login

    @md_login_email_dash
    Cenario: Login utilizando email e senha
        Dado que preencho o email "mobi21001@dimep.com.br" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo MD
        Quando for direcionado para a dashboard e apresentar o nome do funcionario "Pessoa0002 Multi" do ambiente MD e clicar no relogio
        Quando clicar em marcar ponto no aplicativo MD
        Então deverá apresentar a mensagem "PONTO MARCADO COM SUCESSO" em portugues-md 

    @md_login_email_marc
    Cenario: Login utilizando email e senha tela de marcação
        Dado que preencho o email "mobi21003@dimep.com.br" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo MD
        Quando estiver no dashboard em portugues-md clico no menu e e deslogo do app
        Quando clico no botão em portugues-md "Marcar Ponto"
        Quando clicar em marcar ponto no aplicativo MD deverá receber a mensagem "PONTO MARCADO COM SUCESSO" e ficar com a quantidade de "1" marcações por enviar
        Então deverá contem uma marcação "Pendente", clicando em sincronizar deverá informar "Sincronização terminada" e o status de "Sucesso" no envio para o sistema MD

    @md_login_multiuser
    Cenario: Login utilizando utilizando multiuser
        Dado realizo o login com o email "teste198652@dimep.com.br" e  a senha "1" master e clico em "ENTRAR" no aplicativo MD
        Quando estiver no dashboard clico no menu e vou na opção em portugues-md "CONFIGURAÇÃO MÚLTIPLO USUÁRIO" 
        Quando habilito a opção "Habilitar modo de múltiplo usuário" e seleciono a empresa e filial do ambiente MD
            |Empresa|Testes mobile - 23-02-22 - 1010          |
            |Filial |Empresa Filial matriz - 15-07-2022 - 1435|
        Quando clico em "SALVAR", fecho a mensagem de sucesso "Configuração guardada com sucesso Sincronização terminada" em portugues-md e deslogo 
        Então devo conseguir realizar login com as opções Email, Matricula, CPF e PIS, utilizando a senha "1", clicar em "ENTRAR" e receber a mensagem de sucesso ao marcar ponto "PONTO MARCADO COM SUCESSO"
            |MATRÍCULA|2          |
            |CPF      |87545635264|
            |PIS      |11111111140|

    @md_login_azure_cert
    Cenario: Login utilizando azure certificado
        Dado que clico no botão Entrar com azure AD no aplicativo MD
        Quando preencho o email "teste_mdcomune_br@matsantos21hotmail.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente MD
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "usuario MD" e marcar ponto demonstrando a mensagem "PONTO MARCADO COM SUCESSO" em portugues-md

    @md_login_azure_ad
    Cenario: Login utilizando azure ad
        Dado que clico no botão Entrar com azure AD no aplicativo MD
        Quando preencho o email "2019@testexpto.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente MD
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "usuario MD" e marcar ponto demonstrando a mensagem "PONTO MARCADO COM SUCESSO" em portugues-md