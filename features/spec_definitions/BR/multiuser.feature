#language: pt
@multiuser
Funcionalidade: Multiuser

    Permite que o usuario realize login utlizando outras informações.
    sendo elas: Matricula, Pis e CPF

    Exemplos: Acesso o aplicativo mobile, vou na aba CPF e insiro a numeração seguido da senha e realizo o login

    Rule: O funcionario tem que estar vinculado a um usuario

        Exemplos: Para que seja possivel o baixar as informações do funcionario ele precisa contem um usuario vinculado

    Rule: O funcionario tem que contem permissão para login multiuser

        Exemplos: Se o funcionario não contem a permissão de multiuser, suas informações não serão baixadas

    @ativando_multiuser
    Cenario: ativando o multiuser

        Dado que realizo login com o usuario e senha master "teste198652@dimep.com.br", "1"
        Quando eu vou no menu e ativo as configs do multiuser
        E volto para o menu e deslogo
        Então devo ver as opções "MATRÍCULA", "CPF" e "PIS"

    @login_multiuser_matricula
    Cenario: Realizando login com Matricula

        Dado que preencho os dados da Matricula "1" e senha "1" e clico em entrar
        Então devo ser levado pra dashoboard do funcionario "Pessoa0001 Multi"
        
    @login_multiuser_cpf
    Cenario: Realizando login com CPF

        Dado que preencho os dados do CPF "23018147502" e senha "1" e clico em entrar
        Então devo ser levado pra dashoboard do funcionario "Pessoa0002 Multi"

    @login_multiuser_pis
    Cenario: Realizando login com PIS

        Dado que preencho os dados do PIS "11111111132" e senha "1" e clico em entrar
        Então devo ser levado pra dashoboard do funcionario "Pessoa0003 Multi"


        


