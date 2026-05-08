require_relative '../helpers/helpers'
require_relative '../config/constants'

class LoginScreen
    def initialize
        @helpers = Helpers.new
    end
    def login_individual(identificador, senha, botao)
        caminho_identificador = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[1]'
        caminho_scrollview_identificador = '//android.widget.ScrollView/android.view.View/android.widget.EditText[1]'
        caminho_senha = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.widget.FrameLayout/android.widget.FrameLayout/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.widget.EditText[2]'
        caminho_scrollview_senha = '//android.widget.ScrollView/android.view.View/android.widget.EditText[2]'
        @helpers.esconder_teclado
        result_scrollview_ident = @helpers.scroll_view?(caminho_scrollview_identificador)
        
        if result_scrollview_ident
            elemento_identificador = result_scrollview_ident
        else
            elemento_identificador = find_element(xpath: "#{caminho_identificador}")
        end

        elemento_identificador.click
        elemento_identificador.clear
        elemento_identificador.send_keys(identificador)


        result_scrollview_senha = @helpers.scroll_view?(caminho_scrollview_senha)

        if result_scrollview_senha
            elemento_senha = result_scrollview_senha
        else
            elemento_senha = find_element(xpath: "#{caminho_senha}")
        end

        elemento_senha.click
        elemento_senha.clear  
        elemento_senha.send_keys(senha)
        @helpers.esconder_teclado
        find_element(xpath: "//android.widget.Button[@content-desc='#{botao}']").click
        sleep(1)
        end_progress_bar
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

    def permissao_gps
        @driver.manage.timeouts.implicit_wait = 3
        begin
            elemento = find_element(id: "com.android.permissioncontroller:id/permission_message").text
            find_element(id: 'com.android.permissioncontroller:id/permission_allow_foreground_only_button').click
        rescue
            @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
            return
        end
        @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
    end

    def conceder_permissoes
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(id: "com.android.permissioncontroller:id/permission_message").text
                find_element(id: 'com.android.permissioncontroller:id/permission_allow_button').click
                next
            rescue
                @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
                return
            end
        end
        @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
    end
    
    def popup_marc_manter_logado
        begin
            elemento = find_element(id: "android:id/message").text
            find_element(id: 'android:id/button1').click
        rescue
            return
        end
    end
    
    def end_progress_bar
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(xpath: '//android.widget.Button[@content-desc="Carregando..."]')
                next
            rescue
                @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
                return
            end
        end
    end

    def valid_microsoft_title
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(xpath: '//android.view.View[1]/android.widget.Image')
                @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
                return
            rescue
                next
            end
        end
    end

    def valid_microsoft_troca_conta
        @driver.manage.timeouts.implicit_wait = 1
        caminho_botao_outra_conta_azure = '/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout[2]/android.webkit.WebView/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View/android.view.View[2]/android.view.View/android.view.View[2]/android.widget.ListView/android.view.View[8]/android.widget.Button'
        while true
            begin
                elemento = find_element(xpath: '//android.widget.TextView[@text="Escolha uma conta"]')
                find_element(xpath: "//android.widget.Button[@text='Use outra conta']").click
                @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
                return
            rescue
                @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
                return
            end
        end
    end
    
    def find_logotipo
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(xpath: '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.widget.ImageView[2]')
                @driver.manage.timeouts.implicit_wait = Constants::Timeouts::IMPLICIT_WAIT
                return
            rescue
                next
            end
        end
    end

end