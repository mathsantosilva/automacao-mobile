Dado('que realizo login com o usuario master') do
    find_element(xpath: "//android.widget.EditText[@text='E-MAIL']").send_keys("teste198652@dimep.com.br")
    find_element(xpath: "//android.widget.EditText[@text='SENHA']").send_keys("1")
    find_element(xpath: "//android.widget.TextView[@text='ENTRAR']").click
    
  end
  
  Quando('euvou no menu e ativo as configs do multiuser') do
    sleep 25
    find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ImageView').click
    find_element(xpath: '//android.widget.TextView[@text="CONFIGURAÇÃO MÚLTIPLO USUÁRIO"]').click

    find_element(xpath: '//android.widget.CheckBox[@text="Habilitar modo de múltiplo usuário"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="Testes mobile - 23-02-22 - 1010"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="Empresa Filial matriz - 15-07-2022 - 1435"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="SubEmpresa 1 - 24-03-2022 - 1304"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="SubEmpresa 2 - Portaria 1510"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="SubEmpresa 3 - Sem a portaria 1510"]').click
    find_element(xpath: '//android.widget.CheckBox[@text="SubEmpresa 4 - Permissões - 23-05-2022 - 1024"]').click
    find_element(xpath: '//android.widget.TextView[@text="SALVAR"]').click
    sleep 20
    find_element(id: 'android:id/button2').click
    find_element(xpath: '/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ImageView').click
    Appium::TouchAction.new.press(1400, 170).moveTo(950, 170).perform
    find_element(xpath: '//android.widget.CheckBox[@text="SAIR"]').click


  end
  
  Então('quando eu deslogar devo ver as novas opções para login') do
    pending # Write code here that turns the phrase above into concrete actions
  end