Dado('que realizo login com o usuario e senha master {string}, {string}') do |email, senha|
    @login.sign_in("E-MAIL", email, senha)                    
end

Quando('eu vou no menu e ativo as configs do multiuser') do
    sleep 10
    elementos = find_element(xpath: '//android.widget.ImageView')
    puts elementos.class
    find_element(xpath: '//android.widget.ImageView').click
    find_element(xpath: '//android.widget.TextView[@text="CONFIGURAÇÃO MÚLTIPLO USUÁRIO"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="Habilitar modo de múltiplo usuário"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="Testes mobile - 23-02-22 - 1010"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="Empresa Filial matriz - 15-07-2022 - 1435"]').click
    find_element(xpath: '//android.widget.TextView[@text="SALVAR"]').click
    sleep 3
    find_element(id: 'android:id/button2').click 
end

Quando('volto para o menu e deslogo') do
    find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ImageView').click
    find_element(xpath: '//android.widget.ImageView').click
    puts elementos.class
    find_element(xpath: '//android.widget.TextView[@text="SAIR"]').click  
end

Então('devo ver as opções {string}, {string} e {string}') do |login1, login2, login3|
    expect(@login.find_type_login_matricula).to eql login1
    expect(@login.find_type_login_cpf).to eql login2
    expect(@login.find_type_login_pis).to eql login3
end

Dado('que preencho os dados da Matricula {string} e senha {string} e clico em entrar') do |matricula, senha|
    @login.tipo_login('MATRÍCULA')
    @login.sign_in("MATRÍCULA", matricula, senha) 
end

Então('devo ser levado pra dashoboard do funcionario {string}') do |nome|
    expect(@dash.namepeolpe).to eql nome   
end

Dado('que preencho os dados do CPF {string} e senha {string} e clico em entrar') do |cpf, senha|
    @login.tipo_login('CPF')
    @login.sign_in("CPF", cpf, senha)  
end

Dado('que preencho os dados do PIS {string} e senha {string} e clico em entrar') do |pis, senha|
    @login.tipo_login('PIS')
    @login.sign_in("PIS", pis, senha) 
end
