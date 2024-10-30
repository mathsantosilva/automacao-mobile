#language: pt

@br
@br_marcacoes
@br_marcacoes_failed
Funcionalidade: Marcações de ponto 
    Rotina responsável pelo testes dos tipos de marcações de ponto

    @br_marcacoes_failed_local_empr_fora_raio_1510
    Cenario: Realizar a marcação de ponto Fora do raio da empresa - 1510
        Dado realizo o login com o usuario "mobi21004@dimep.com.br" e utilizo o botão "ENTRAR"
        Quando vou até a tela de marcação e marco ponto fora do raio 
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS ESTÁ AFASTADO DO LOCAL PERMITIDO PARA MARCAÇÃO DE PONTO" e o contador de marcações offline continue em "0"

    @br_marcacoes_failed_local_alter_fora_raio_1510
    Cenario: Realizar a marcação de ponto Fora do raio da empresa - 1510
        Dado realizo o login com o usuario "mobi21005@dimep.com.br" e utilizo o botão "ENTRAR"
        Quando vou até a tela de marcação e marco ponto fora do raio 
        Então devo receber a mensagem de erro "NÃO FOI POSSIVEL ACEITAR A SUA MARCAÇÃO POIS ESTÁ AFASTADO DO LOCAL PERMITIDO PARA MARCAÇÃO DE PONTO" e o contador de marcações offline continue em "0"