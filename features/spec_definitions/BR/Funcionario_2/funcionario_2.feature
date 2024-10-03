#language: pt

@br
@br_funcionario_2
Funcionalidade: Realizar marcação de ponto 
    Rotina responsável pela marcação de ponto do funcionario 2
    
    @br_funcionario_2_botao_entrar_com_internet
    Cenario: Realizar marcação de ponto com internet 
        Dado que realizo o login normal utilizando o login "mobi21002@dimep.com.br" e a senha "1" e clico no botão "ENTRAR"
        Quando valido o nome do funcionario "Pessoa0002 Multi" e vou até a tela de marcação
        Então devo conseguir marcar o ponto online e receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_funcionario_2_botao_marcarponto_com_internet
    Cenario: Realizar marcação de ponto com internet 
        Dado que realizo o login direto utilizando o login "mobi21002@dimep.com.br" e a senha "1" e clico no botão "Marcar Ponto"
        Então devo conseguir marcar o ponto online e receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_funcionario_2_sem_internet
    Cenario: Realizar marcação de ponto com internet 
        Dado que realizo o login normal utilizando o login "mobi21002@dimep.com.br" e a senha "1" e clico no botão "ENTRAR"
        Quando valido o nome do funcionario "Pessoa0002 Multi" e vou até a tela de marcação
        Quando desativo a internet do celular e realizo a marcação de ponto offline
        Quando receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"

