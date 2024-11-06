#language: pt

@pt
@pt_marcacoes
@pt_marcacoes_failed
Funcionalidade: Marcações de ponto
    Rotina responsável pelo testes dos tipos de marcações de ponto

    @pt_marcacoes_failed_local
    @pt_marcacoes_failed_local_empr_fora_raio_1510
    Cenario: Realizar a marcação de ponto Fora do raio da empresa - 1510 PT
        Dado realizo o login com o usuario "mobi21004@dimep.pt" e utilizo o botão "ENTRAR" PT
        Quando vou até a tela de marcação e marco ponto fora do raio PT
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS ESTÁ AFASTADO DO LOCAL PERMITIDO PARA MARCAÇÃO DE PONTO" e o contador de marcações offline continue em "0" PT
		
    @pt_marcacoes_failed_local
    @pt_marcacoes_failed_local_alter_fora_raio_1510
    Cenario: Realizar a marcação de ponto Fora do raio da empresa - 1510 PT
        Dado realizo o login com o usuario "mobi21005@dimep.pt" e utilizo o botão "ENTRAR" PT
        Quando vou até a tela de marcação e marco ponto fora do raio PT
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS ESTÁ AFASTADO DO LOCAL PERMITIDO PARA MARCAÇÃO DE PONTO" e o contador de marcações offline continue em "0" PT
		
    # Rodar somente no emulador
    @pt_marcacoes_failed_smarttag
    @pt_marcacoes_failed_smarttag_especifica
    Cenario: Realizar a marcação de ponto online utilizando Smart tag especifica não encontrada PT
        Dado realizo o login com o usuario "mobi21008@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS NENHUM PONTO AQUI PERMITIDA FOI ENCONTRADA" e o contador de marcações offline continue em "0" PT

    # Rodar somente no emulador
    @pt_marcacoes_failed_smarttag
    @pt_marcacoes_failed_smarttag_qualquer
    Cenario: Realizar a marcação de ponto online utilizando qualquer Smart tag não encontrada PT
        Dado realizo o login com o usuario "mobi21009@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS NENHUM PONTO AQUI PERMITIDA FOI ENCONTRADA" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_failed_chave_empare
    @pt_marcacoes_failed_chave_empare_sem_chave
    Cenario: Realizar a marcação de ponto sem sincronizar a chave de emparelhamento PT
        Dado que realizo o login com o usuario "mobi21007@dimep.pt" e clico no botão "ENTRAR" recebo a mensagem "Ocorreu um erro a emparelhar a chave. (Em caso de atualização no cadastro Favor logar novamente no modo online)" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então deve aparecer um popup informando "Não foi possível aceitar a sua marcação. Aparelho já se encontra com chave de emparelhamento de outro usuário." PT