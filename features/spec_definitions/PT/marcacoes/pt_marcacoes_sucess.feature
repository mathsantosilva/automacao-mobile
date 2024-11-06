#language: pt

@pt
@pt_marcacoes
@pt_marcacoes_sucess
Funcionalidade: Marcações de ponto
    Rotina responsável pelo testes dos tipos de marcações de ponto
	
    @pt_marcacoes_sucess_local
    @pt_marcacoes_sucess_local_empr_dentro_raio_1510
    Cenario: Realizar a marcação de ponto dentro do raio daempresa - 1510 PT
        Dado realizo o login com o usuario "mobi21004@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_local
    @pt_marcacoes_sucess_local_empr_dentro_raio_671
    Cenario: Realizar a marcação de ponto dentro do raio daempresa - 671 PT
        Dado realizo o login com o usuario "mobi22004@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_local
    @pt_marcacoes_sucess_local_alter_dentro_raio_1510
    Cenario: Realizar a marcação de ponto dentro do raio do local alteranativo - 1510 PT
        Dado realizo o login com o usuario "mobi21005@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_local
    @pt_marcacoes_sucess_local_alter_dentro_raio_671
    Cenario: Realizar a marcação de ponto dentro do raio do local alteranativo - 671 PT
        Dado realizo o login com o usuario "mobi22005@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_poff
    @pt_marcacoes_sucess_poff_online_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline PT
        Dado realizo o login com o usuario "mobi21002@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_soff
    @pt_marcacoes_sucess_soff_online_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline PT
        Dado realizo o login com o usuario "mobi21003@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Quando a marcação e efetuada devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1" PT
        Quando for na tela de sincronização de marcações devo conseguir ver a marcação com status "Pendente" PT
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload  PT
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso" PT

    @pt_marcacoes_sucess_poff
    @pt_marcacoes_sucess_poff_offline_1510
    Cenario: Realizar a marcação de ponto offline quando o funcionario permite offline PT
        Dado realizo o login com o usuario "mobi21002@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto offline PT
        Quando a marcação e efetuada devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1" PT
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente" PT
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload  PT
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso" PT

    @pt_marcacoes_sucess_soff
    @pt_marcacoes_sucess_soff_offline_1510
    Cenario: Realizar a marcação de ponto online quando o funcionario permite offline PT
        Dado realizo o login com o usuario "mobi21003@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto offline PT
        Quando a marcação e efetuada devo receber a mensagem "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1" PT
        Quando for na tela de sincronização de marcações e ativar a internet devo conseguir ver a marcação com status "Pendente" PT
        Quando for clicado no botão sincronizar deve iniciar o progresso de upload  PT
        Então deve aparecer um popup com a mensagem "Sincronização terminada" após fechar o status da marcação deverá estar como "Sucesso" PT

    @pt_marcacoes_sucess_obra
    @pt_marcacoes_sucess_obra_nao_selecionado
    Cenario: Realizar a marcação de ponto online não selecionando nenhuma obra PT
        Dado realizo o login com o usuario "mobi21015@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_obra
    @pt_marcacoes_sucess_obra_selecionada
    Cenario: Realizar a marcação de ponto online não selecionando nenhuma obra PT
        Dado realizo o login com o usuario "mobi21015@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto selecionando uma obra PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    # Rodar somente em dispositivo fisico
    @pt_marcacoes_sucess_smarttag
    @pt_marcacoes_sucess_smarttag_especifica
    Cenario: Realizar a marcação de ponto online utilizando Smart tag especifica PT
        Dado realizo o login com o usuario "mobi21008@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    # Rodar somente em dispositivo fisico
    @pt_marcacoes_sucess_smarttag
    @pt_marcacoes_sucess_smarttag_qualquer
    Cenario: Realizar a marcação de ponto online utilizando qualquer Smart tag  PT
        Dado realizo o login com o usuario "mobi21009@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_chave_empare
    @pt_marcacoes_sucess_chave_empare_autosinc
    Cenario: Realizar a marcação de ponto online com chave sincronizada automaticamente PT
        Dado que crio uma nova chave de emparelhamento e realizo o login com o usuario "mobi21007@dimep.pt" e clico no botão "ENTRAR" PT
        Quando vou até a tela de marcação e realizo a marcação de ponto normalmente PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_chave_empare
    @pt_marcacoes_sucess_chave_empare_manual
    Cenario: Realizar a marcação de ponto online com chave inserida manualmente PT
        Dado realizo o login com o usuario "mobi21007@dimep.pt" clico no botão "ENTRAR" e recebo a mensagem "Ocorreu um erro a emparelhar a chave. (Em caso de atualização no cadastro Favor logar novamente no modo online)" PT
        Quando vou até a tela da chave de emparelhamento e clico no botão "EMPARELHAR" para sincronizar a chave "CHAVE ATIVA DESDE" PT
        Quando retorno a tela de marcação de ponto e realizo a marcação PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_reconhecimento_facial
    @pt_marcacoes_sucess_reconhecimento_facial_dentro
    Cenario: Realizar a marcação de ponto online utilizando reconhecimento facial PT
        Dado realizo o login com o usuario "mobi21001@dimep.pt" e clico no botão "ENTRAR" PT
        Quando realizo a marcação de ponto e utilizo o reconhecimento facial PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_reconhecimento_facial
    @pt_marcacoes_sucess_reconhecimento_facial_fora
    Cenario: Realizar a marcação de ponto online utilizando reconhecimento facial PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando acesso o reconhecimento facial e reconhece a face "Sucesso! CPF: 81281511854" PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" no reconhecimento facial PT

    # Rodar somente no emulador
    @pt_marcacoes_sucess_autentication
    @pt_marcacoes_sucess_autentication_fingerprint
    Cenario: Realizar a marcação de ponto online utilizando autenticação do dispositivo PT
        Dado realizo o login com o usuario "mobi21036@dimep.pt" e clico no botão "ENTRAR" PT
        Quando realizo a marcação de ponto e utilizo a autenticação para validar a marcação PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_matricula
    @pt_marcacoes_sucess_multiuser_matricula_1
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "MATRÍCULA" com "1" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_matricula
    @pt_marcacoes_sucess_multiuser_matricula_2
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "MATRÍCULA" com "2" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_matricula
    @pt_marcacoes_sucess_multiuser_matricula_3
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "MATRÍCULA" com "3" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_matricula
    @pt_marcacoes_sucess_multiuser_matricula_4
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "MATRÍCULA" com "4" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_matricula
    @pt_marcacoes_sucess_multiuser_matricula_5
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "MATRÍCULA" com "5" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_cpf
    @pt_marcacoes_sucess_multiuser_cpf_1
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "CPF" com "81281511854" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_cpf
    @pt_marcacoes_sucess_multiuser_cpf_2
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "CPF" com "21028546637" e realizo a marcação de ponto  PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_cpf
    @pt_marcacoes_sucess_multiuser_cpf_3
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "CPF" com "87545635264" e realizo a marcação de ponto  PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_cpf
    @pt_marcacoes_sucess_multiuser_cpf_4
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "CPF" com "03837836231" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_cpf
    @pt_marcacoes_sucess_multiuser_cpf_5
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "CPF" com "83217187520" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_pis
    @pt_marcacoes_sucess_multiuser_pis_1
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "PIS" com "11111111116" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_pis
    @pt_marcacoes_sucess_multiuser_pis_2
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "PIS" com "14733196454" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_pis
    @pt_marcacoes_sucess_multiuser_pis_3
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "PIS" com "11111111132" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "1" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_pis
    @pt_marcacoes_sucess_multiuser_pis_4
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "PIS" com "11111111140" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT

    @pt_marcacoes_sucess_multiuser
    @pt_marcacoes_sucess_multiuser_pis
    @pt_marcacoes_sucess_multiuser_pis_5
    Cenario: Realizar a marcação de ponto online utilizando modo multiuser PT
        Dado realizo o login com o usuario "mobistore@dimep.pt" e clico no botão "ENTRAR" PT
        Quando ativo o modo multiuser recebo a mensagem "Configuração guardada com sucesso\nSincronização terminada" quantidade de usuario "20 Usuário(s)" e deslogo PT
        Quando realizo o login no modo "PIS" com "11111111159" e realizo a marcação de ponto PT
        Então devo receber a mensagem de sucesso "PONTO MARCADO COM SUCESSO" e o contador de marcações offline continue em "0" PT
