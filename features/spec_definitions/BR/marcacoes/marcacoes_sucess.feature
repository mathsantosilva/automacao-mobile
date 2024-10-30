#language: pt

@br
@br_marcacoes
@br_marcacoes_sucess
Funcionalidade: Marcações de ponto 
    Rotina responsável pelo testes dos tipos de marcações de ponto

    @br_marcacoes_sucess_local_empr_dentro_raio_1510
    Cenario: Realizar a marcação de ponto dentro do raio daempresa - 1510
        Dado realizo o login com o usuario "mobi21004@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_local_empr_dentro_raio_671
    Cenario: Realizar a marcação de ponto dentro do raio daempresa - 671
        Dado realizo o login com o usuario "mobi22004@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_local_alter_dentro_raio_1510
    Cenario: Realizar a marcação de ponto dentro do raio do local alteranativo - 1510
        Dado realizo o login com o usuario "mobi21005@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso"PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_local_alter_dentro_raio_671
    Cenario: Realizar a marcação de ponto dentro do raio do local alteranativo - 671
        Dado realizo o login com o usuario "mobi22005@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_poff_online_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_soff_online_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21003@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Quando devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"

    @br_marcacoes_sucess_poff_offline_1510
    Cenario: Realizar a marcação de ponto offline quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto offline
        Quando devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"

    @br_marcacoes_sucess_soff_offline_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21003@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto offline
        Quando devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"