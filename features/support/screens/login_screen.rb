class LoginScreen
    def sign_in(tipo, email, password)
        find_element(xpath: "//android.widget.EditText[@text='#{tipo}']").send_keys(email)
        find_element(xpath: "//android.widget.EditText[@text='SENHA']").send_keys(password)
        Appium::TouchAction.new.tap(start_x: 0.50, start_y: 0.670, offset_x: 0.40, offset_y: 0.670, duration: 1000)
        find_element(xpath: "//android.widget.TextView[@text='ENTRAR']").click
    end

    def tipo_login(text)
        find_element(xpath: "//android.widget.TextView[@text='#{text}']").click
    end

    def find_type_login_matricula
        find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView").text
    end       

    def find_type_login_cpf
        find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup[3]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView").text
    end

    def find_type_login_pis
        find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[4]/android.view.ViewGroup[4]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView").text
    end         
end