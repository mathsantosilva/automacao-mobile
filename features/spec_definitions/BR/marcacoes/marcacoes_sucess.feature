#language: pt

@br
@br_marcacoes
@br_marcacoes_sucess
Funcionalidade: Marcações de ponto 
    Rotina responsável pelo testes dos tipos de marcações de ponto

    @br_marcacoes_sucess_local
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
    
    @br_marcacoes_sucess_local
    @br_marcacoes_sucess_local_alter_dentro_raio_1510
    Cenario: Realizar a marcação de ponto dentro do raio do local alteranativo - 1510
        Dado realizo o login com o usuario "mobi21005@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"
    
    @br_marcacoes_sucess_local_alter_dentro_raio_671
    Cenario: Realizar a marcação de ponto dentro do raio do local alteranativo - 671
        Dado realizo o login com o usuario "mobi22005@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_poff
    @br_marcacoes_sucess_poff_online_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_soff
    @br_marcacoes_sucess_soff_online_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21003@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Quando a marcação e efetuada devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"

    @br_marcacoes_sucess_poff
    @br_marcacoes_sucess_poff_offline_1510
    Cenario: Realizar a marcação de ponto offline quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21002@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto offline
        Quando a marcação e efetuada devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"
    
    @br_marcacoes_sucess_soff
    @br_marcacoes_sucess_soff_offline_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline
        Dado realizo o login com o usuario "mobi21003@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto offline
        Quando a marcação e efetuada devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente"
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload 
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso"

    @br_marcacoes_sucess_obra
    @br_marcacoes_sucess_obra_nao_selecionado
    Cenario: Realizar a marcação de ponto online não selecionando nenhuma obra
        Dado realizo o login com o usuario "mobi21015@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"
    
    @br_marcacoes_sucess_obra
    @br_marcacoes_sucess_obra_selecionada
    Cenario: Realizar a marcação de ponto online não selecionando nenhuma obra
        Dado realizo o login com o usuario "mobi21015@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto selecionando uma obra
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    # Rodar somente em dispositivo fisico
    @br_marcacoes_sucess_smarttag
    @br_marcacoes_sucess_smarttag_especifica
    Cenario: Realizar a marcação de ponto online utilizando Smart tag especifica
        Dado realizo o login com o usuario "mobi21008@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    # Rodar somente em dispositivo fisico
    @br_marcacoes_sucess_smarttag
    @br_marcacoes_sucess_smarttag_qualquer
    Cenario: Realizar a marcação de ponto online utilizando qualquer Smart tag 
        Dado realizo o login com o usuario "mobi21009@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_chave_empare
    @br_marcacoes_sucess_chave_empare_autosinc
    Cenario: Realizar a marcação de ponto online com chave sincronizada automaticamente
        Dado que crio uma nova chave de emparelhamento e realizo o login com o usuario "mobi21007@dimep.com.br" e clico no botão "ENTRAR"
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_chave_empare
    @br_marcacoes_sucess_chave_empare_manual
    Cenario: Realizar a marcação de ponto online com chave inserida manualmente
        Dado realizo o login com o usuario "mobi21007@dimep.com.br" clico no botão "ENTRAR" e recebo a mensagem "Ocorreu um erro a emparelhar a chave. (Em caso de atualização no cadastro Favor logar novamente no modo online)"
        Quando vou até a tela da chave de emparelhamento e clico no botão "EMPARELHAR" para sincronizar a chave "CHAVE ATIVA DESDE"
        Quando retorno a tela de marcação de ponto e realizo a marcação
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_reconhecimento_facial
    @br_marcacoes_sucess_reconhecimento_facial_dentro
    Cenario: Realizar a marcação de ponto online utilizando reconhecimento facial
        Dado realizo o login com o usuario "mobi21001@dimep.com.br" e clico no botão "ENTRAR"
        Quando realizo a marcação de ponto e utilizo o reconhecimento facial
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_reconhecimento_facial
    @br_marcacoes_sucess_reconhecimento_facial_fora
    Cenario: Realizar a marcação de ponto online utilizando reconhecimento facial
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando acesso o reconhecimento facial e reconhece a face "Sucesso! CPF: 81281511854"
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" no reconhecimento facial

    # Rodar somente no emulador
    @br_marcacoes_sucess_autentication
    @br_marcacoes_sucess_autentication_fingerprint
    Cenario: Realizar a marcação de ponto online utilizando autenticação do dispositivo
        Dado realizo o login com o usuario "mobi21036@dimep.com.br" e clico no botão "ENTRAR"
        Quando realizo a marcação de ponto e utilizo a autenticação para validar a marcação
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_matricula
    @br_marcacoes_sucess_multiuser_matricula_1
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "MATRÍCULA" com "1" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_matricula
    @br_marcacoes_sucess_multiuser_matricula_2
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "MATRÍCULA" com "2" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_matricula
    @br_marcacoes_sucess_multiuser_matricula_3
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "MATRÍCULA" com "3" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_matricula
    @br_marcacoes_sucess_multiuser_matricula_4
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "MATRÍCULA" com "4" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_matricula
    @br_marcacoes_sucess_multiuser_matricula_5
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "MATRÍCULA" com "5" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_cpf
    @br_marcacoes_sucess_multiuser_cpf_1
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "CPF" com "81281511854" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_cpf
    @br_marcacoes_sucess_multiuser_cpf_2
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "CPF" com "21028546637" e realizo a marcação de ponto 
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_cpf
    @br_marcacoes_sucess_multiuser_cpf_3
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "CPF" com "87545635264" e realizo a marcação de ponto 
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_cpf
    @br_marcacoes_sucess_multiuser_cpf_4
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "CPF" com "03837836231" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_cpf
    @br_marcacoes_sucess_multiuser_cpf_5
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "CPF" com "83217187520" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_pis
    @br_marcacoes_sucess_multiuser_pis_1
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "PIS" com "11111111116" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_pis
    @br_marcacoes_sucess_multiuser_pis_2
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "PIS" com "14733196454" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_pis
    @br_marcacoes_sucess_multiuser_pis_3
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "PIS" com "11111111132" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_pis
    @br_marcacoes_sucess_multiuser_pis_4
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "PIS" com "11111111140" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"

    @br_marcacoes_sucess_multiuser
    @br_marcacoes_sucess_multiuser_pis
    @br_marcacoes_sucess_multiuser_pis_5
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser
        Dado realizo o login com o usuario "mobistore@dimep.com.br" e clico no botão "ENTRAR"
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo
        Quando realizo o login no modo "PIS" com "11111111159" e realizo a marcação de ponto
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0"
