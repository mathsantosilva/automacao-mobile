#language: pt

@br
@br_marcacoes
@br_marcacoes_failed
Funcionalidade: Marcações de ponto 
    Rotina responsável pelo testes dos tipos de marcações de ponto

    @br_marcacoes_failed_local
    @br_marcacoes_failed_local_empr_fora_raio_1510
    Cenario: Realizar a marcação de ponto Fora do raio da empresa - 1510
        Dado realizo o login com o usuario "mobi21004@dimep.com.br" e utilizo o botão "ENTRAR"
        Quando vou até a tela de marcação e marco ponto fora do raio 
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS ESTÁ AFASTADO DO LOCAL PERMITIDO PARA MARCAÇÃO DE PONTO" e o contador de marcações offline continue em "0"
    
    @br_marcacoes_failed_local
    @br_marcacoes_failed_local_alter_fora_raio_1510
    Cenario: Realizar a marcação de ponto Fora do raio da empresa - 1510
        Dado realizo o login com o usuario "mobi21005@dimep.com.br" e utilizo o botão "ENTRAR"
        Quando vou até a tela de marcação e marco ponto fora do raio 
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS ESTÁ AFASTADO DO LOCAL PERMITIDO PARA MARCAÇÃO DE PONTO" e o contador de marcações offline continue em "0"

    # Rodar somente no emulador 
    @br_marcacoes_failed_smarttag
    @br_marcacoes_failed_smarttag_especifica
    Cenario: Realizar a marcação de ponto online utilizando Smart tag especifica não encontrada
        Dado realizo o login com o usuario "mobi21008@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS NENHUM PONTO AQUI PERMITIDA FOI ENCONTRADA" e o contador de marcações offline continue em "0"

    # Rodar somente no emulador         
    @br_marcacoes_failed_smarttag
    @br_marcacoes_failed_smarttag_qualquer
    Cenario: Realizar a marcação de ponto online utilizando qualquer Smart tag não encontrada
        Dado realizo o login com o usuario "mobi21009@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS NENHUM PONTO AQUI PERMITIDA FOI ENCONTRADA" e o contador de marcações offline continue em "0"

    @br_marcacoes_failed_chave_empare
    @br_marcacoes_failed_chave_empare_sem_chave
    Cenario: Realizar a marcação de ponto sem sincronizar a chave de emparelhamento
        Dado que realizo o login com o usuario "mobi21007@dimep.com.br" e clico no botão "ENTRAR" recebo a mensagem "Ocorreu um erro a emparelhar a chave. (Em caso de atualização no cadastro Favor logar novamente no modo online)"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então deve aparecer um popup informando "Não foi possível aceitar a sua marcação. Aparelho já se encontra com chave de emparelhamento de outro usuário."
   
