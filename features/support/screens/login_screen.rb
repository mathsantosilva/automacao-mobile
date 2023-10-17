class LoginScreen
    def sign_in(tipo, email, password)
        find_element(xpath: "//android.widget.EditText[@text='#{tipo}']").send_keys(email)
        find_element(xpath: "//android.widget.EditText[@text='SENHA']").send_keys(password)
        hide_keyboard
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

    def permissao_bluetooth
        sleep 2
        begin
            elemento = find_element(id: "com.android.permissioncontroller:id/permission_message").text
            find_element(id: 'com.android.permissioncontroller:id/permission_allow_button').click
        rescue
            return
        end
    end
    def permissao_gps
        sleep 2
        begin
            elemento = find_element(id: "com.android.permissioncontroller:id/permission_message").text
            find_element(id: 'com.android.permissioncontroller:id/permission_allow_foreground_only_button').click
        rescue
            return
        end
    end
    def permissao_pasta
        sleep 2
        begin
            elemento = find_element(id: "com.android.permissioncontroller:id/permission_message").text
            find_element(id: 'com.android.permissioncontroller:id/permission_allow_button').click
        rescue
            return
        end
    end
    def popup_marc_manter_logado
        sleep 2
        begin
            elemento = find_element(id: "android:id/message").text
            find_element(id: 'android:id/button1').click
        rescue
            return
        end
    end
end