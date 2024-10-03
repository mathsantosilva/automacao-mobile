#language: pt

@br
@br_login
Funcionalidade: Login no app mobile
    Rotina responsável pelo testes dos diferentes tipos de login
    
    @br_login_email_dash
    Cenario: Login utilizando email e senha
        Dado que preencho o email "mobi21002@dimep.com.br" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo BR
        Quando for direcionado para a dashboard e apresentar o nome do funcionario "Pessoa0002 Multi" do ambiente BR e clicar no relogio
        Quando clicar em marcar ponto no aplicativo BR
        Então deverá apresentar a mensagem "PONTO MARCADO COM SUCESSO" em portugues-br 

    @br_login_email_marc
    Cenario: Login utilizando email e senha tela de marcação
        Dado que preencho o email "mobi21003@dimep.com.br" e  a senha "1" e clico no botão principal "ENTRAR" no aplicativo BR
        Quando estiver no dashboard em portugues-br clico no menu e e deslogo do app
        Quando clico no botão em portugues-br "Marcar Ponto"
        Quando clicar em marcar ponto no aplicativo BR deverá receber a mensagem "PONTO MARCADO COM SUCESSO" e ficar com a quantidade de "1" marcações por enviar
        Então deverá contem uma marcação "Pendente", clicando em sincronizar deverá informar "Sincronização terminada" e o status de "Sucesso" no envio para o sistema BR

    @br_login_multiuser
    Cenario: Login utilizando utilizando multiuser
        Dado realizo o login com o email "mobistore@dimep.com.br" e  a senha "1" master e clico em "ENTRAR" no aplicativo BR
        Quando estiver no dashboard clico no menu e vou na opção em portugues-br "CONFIGURAÇÃO MÚLTIPLO USUÁRIO" 
        Quando habilito a opção "Habilitar modo de múltiplo usuário" e seleciono a empresa e filial do ambiente BR
            |Empresa|Testes mobile - 23-02-22 - 1010          |
            |Filial |Empresa Filial matriz - 15-07-2022 - 1435|
        Quando clico em "SALVAR", fecho a mensagem de sucesso "Configuração guardada com sucesso Sincronização terminada" em portugues-br e deslogo 
        Então devo conseguir realizar login no ambiente BR com as opções Email, Matricula, CPF e PIS, utilizando a senha "1", clicar em "ENTRAR" e receber a mensagem de sucesso ao marcar ponto "PONTO MARCADO COM SUCESSO"
            |MATRÍCULA|2          |
            |CPF      |83217187520|
            |PIS      |11111111140|

    @br_login_azure_cert
    Cenario: Login utilizando azure certificado
        Dado que clico no botão Entrar com azure AD no aplicativo BR
        Quando preencho o email "teste_kairos_br@matsantos21hotmail.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente BR
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "usuario 3" e marcar ponto demonstrando a mensagem "PONTO MARCADO COM SUCESSO" em portugues-br

    @br_login_azure_ad
    Cenario: Login utilizando azure ad
        Dado que clico no botão Entrar com azure AD no aplicativo BR
        Quando preencho o email "2019@testexpto.onmicrosoft.com" e senha "Dimep*25" e clico em entrar na microsoft enterprise do ambiente BR
        Então deverá direcionar para a dashboard e apresentar o nome do funcionario azure "Pessoa0031 Ad" e marcar ponto demonstrando a mensagem "PONTO MARCADO COM SUCESSO" em portugues-br