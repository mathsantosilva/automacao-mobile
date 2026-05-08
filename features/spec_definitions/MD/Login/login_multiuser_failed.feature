#language: pt

@md
@md_login_multiuser
@md_login_multiuser_failure
Funcionalidade: Login no modo multiusuário - Falhas
    Rotina responsável pelos testes de falha dos diferentes tipos de login

    Contexto:
        Dado que estou na tela de login multiusuário "Login usando:" e estou "Online"

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_email
    @md_login_multiuser_failure_email_mensagem_campo
    Esquema do Cenario: Não deve realizar login com validação de campo no E-mail
        Dado seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador                  | senha | mensagem                   |
            | email_invalido                 | 1     | Indique um e-mail válido   |
            |                                | 1     | Indique o e-mail           |
            | mobi21001@madis.com.br         |       | Indique a senha            |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_email
    @md_login_multiuser_failure_email_mensagem_popup
    Esquema do Cenario: Não deve realizar login com E-mail ou senha incorretos
        Dado seleciono a opção de login "E-mail"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador               | senha | mensagem                               |
            | email_invalido@madis.com.br | 1     | Utilizador e/ou senha estão incorretos |
            | mobi21001@madis.com.br      | 999   | Utilizador e/ou senha estão incorretos |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_pis
    @md_login_multiuser_failure_pis_mensagem_campo
    Esquema do Cenario: Não deve realizar login com campos obrigatórios não preenchidos no login por PIS
        Dado seleciono a opção de login "PIS"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador | senha | mensagem               |
            |               | 1     | Indique o PIS          |
            | 123           | 1     | Indique um PIS válido  |
            | 11111111116   |       | Indique a senha        |
            


    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_pis
    @md_login_multiuser_failure_pis_mensagem_popup
    Esquema do Cenario: Não deve realizar login utilizando PIS inválido
        Dado seleciono a opção de login "PIS"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador | senha | mensagem                                |
            | 00000000000   | 1     | Utilizador e/ou senha estão incorretos  |
            | 11111111116   | 999   | Utilizador e/ou senha estão incorretos  |
            | 14733196454   | 999   | Utilizador e/ou senha estão incorretos  |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_cpf
    @md_login_multiuser_failure_cpf_mensagem_campo
    Esquema do Cenario: Não deve realizar login utilizando CPF inválido
        Dado seleciono a opção de login "CPF"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador | senha | mensagem                   |
            |               | 1     | Indique o CPF              |
            | 123           | 1     | Indique um CPF válido      |
            | 81281511854   |       | Indique a senha            |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_cpf
    @md_login_multiuser_failure_cpf_mensagem_popup
    Esquema do Cenario: Não deve realizar login utilizando CPF inválido
        Dado seleciono a opção de login "CPF"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador | senha | mensagem                   |
            | 00000000000   | 1     | Utilizador e/ou senha estão incorretos |
            | 81281511854   | 999   | Utilizador e/ou senha estão incorretos |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_matricula
    @md_login_multiuser_failure_matricula_mensagem_campo
    Esquema do Cenario: Não deve realizar login utilizando Matrícula inválida
        Dado seleciono a opção de login "Matrícula"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador | senha | mensagem                   |
            |               | 1     | Indique a matrícula        |
            | 1             |       | Indique a senha            |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_matricula
    @md_login_multiuser_failure_matricula_mensagem_popup
    Esquema do Cenario: Não deve realizar login utilizando Matrícula inválida
        Dado seleciono a opção de login "Matrícula"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | identificador | senha | mensagem                   |
            | 999999        | 1     | Utilizador e/ou senha estão incorretos |
            | 1             | 999   | Utilizador e/ou senha estão incorretos |
            | abc           | 1     | Utilizador e/ou senha estão incorretos |

    @md_login_multiuser_failure_online
    @md_login_multiuser_failure_tipo_login_incorreto
    Esquema do Cenario: Não deve realizar login quando o tipo de login não corresponde ao identificador informado
        Dado seleciono a opção de login "<tipo_login>"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | tipo_login | identificador          | senha | mensagem                               |
            | E-mail     | 81281511854            | 1     | Indique um e-mail válido               |
            | PIS        | mobi21001@madis.com.br | 1     | Utilizador e/ou senha estão incorretos |
            | CPF        | mobi21001@madis.com.br | 1     | Indique um CPF válido                  |
            | Matrícula  | mobi21001@madis.com.br | 1     | Utilizador e/ou senha estão incorretos |

    @md_login_multiuser_failure_offline
    @md_login_multiuser_failure_offline_login_sem_permissao
    Esquema do Cenario: Não deve realizar login offline quando o usuário não tem permissão para marcação offline
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "<tipo_login>"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | tipo_login | identificador          | senha | mensagem                                          |
            | E-mail     | mobi21001@madis.com.br | 1     | Usuário não tem permissão para marcação offline   |
            | PIS        | 11111111116            | 1     | Usuário não tem permissão para marcação offline   |
            | CPF        | 81281511854            | 1     | Usuário não tem permissão para marcação offline   |
            | Matrícula  | 1                      | 1     | Usuário não tem permissão para marcação offline   |

    @md_login_multiuser_failure_offline
    @md_login_multiuser_failure_offline_login_senha_incorreta
    Esquema do Cenario: Não deve realizar relogin offline com senha incorreta
        Dado que desativo a internet do dispositivo para ficar "Offline"
        E seleciono a opção de login "<tipo_login>"
        E informo o identificador "<identificador>"
        E informo a senha "<senha>"
        Quando clico no botão "Entrar"
        Então devo visualizar a mensagem de erro "<mensagem>"
        E devo permanecer na tela de login multiusuário

        Exemplos:
            | tipo_login | identificador          | senha | mensagem                               |
            | E-mail     | mobi21002@madis.com.br | 999   | Utilizador e/ou senha estão incorretos |
            | PIS        | 14733196454            | 999   | Utilizador e/ou senha estão incorretos |
            | CPF        | 21028546637            | 999   | Utilizador e/ou senha estão incorretos |
            | Matrícula  | 2                      | 999   | Utilizador e/ou senha estão incorretos |
