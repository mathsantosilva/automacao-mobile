require_relative '../config/constants'

class Helpers
    def app_package_from_caps
        caps = driver.capabilities

        caps[:appPackage] ||
            caps['appPackage'] ||
            caps[:'appium:appPackage'] ||
            caps['appium:appPackage']
    end

    def sessao_valida?
        return false if driver.nil?

        begin
            # Comando leve para validar se a sessão ainda responde
            driver.session_id
            driver.capabilities
            return true
        rescue Selenium::WebDriver::Error::InvalidSessionIdError
            puts "Sessão inválida ou encerrada."
            return false
        rescue Selenium::WebDriver::Error::WebDriverError => e
            puts "Erro ao validar sessão: #{e.class} - #{e.message}"
            return false
        rescue StandardError => e
            puts "Erro inesperado ao validar sessão: #{e.class} - #{e.message}"
            return false
        end

    end

    def anexar_screenshot_allure(scenario)
        unless sessao_valida?
            puts "[SCREENSHOT] Screenshot ignorada porque a sessão não está válida."
            return
        end

        begin
            binary_shot = driver.screenshot_as(:base64)

            diretorio_atual = Dir.pwd
            logs_dir = File.join(diretorio_atual, 'logs')
            timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
            scenario_name = scenario.name.gsub(/[^0-9A-Za-z]/, '_')
            temp_shot = File.join(logs_dir, "#{timestamp}_#{scenario_name}.png")

            FileUtils.mkdir_p(logs_dir)

            File.open(temp_shot, 'wb') do |f|
            f.write(Base64.decode64(binary_shot))
            end

            Allure.add_attachment(
            name: "screenshot",
            type: Allure::ContentType::PNG,
            source: File.open(temp_shot, 'rb')
            )

        rescue Selenium::WebDriver::Error::InvalidSessionIdError
            puts "[SCREENSHOT] Não foi possível anexar. Sessão encerrada."

        rescue Selenium::WebDriver::Error::WebDriverError => e
            puts "[SCREENSHOT] Erro do WebDriver ao tirar screenshot: #{e.class} - #{e.message}"

        rescue StandardError => e
            puts "[SCREENSHOT] Erro inesperado ao anexar screenshot: #{e.class} - #{e.message}"
        end
    end

    def scroll_view?(xpath)
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(xpath: "#{xpath}")
                @driver.manage.timeouts.implicit_wait =  Constants::Timeouts::IMPLICIT_WAIT
                return elemento
            rescue
                return nil
            end
        end
    end

    def limpar_dados_app(app_package)
        driver.terminate_app(app_package)

        driver.execute_script('mobile: shell', {
            command: 'pm',
            args: ['clear', app_package]
        })

        driver.activate_app(app_package)
    end

    def conceder_permissoes
        @driver.manage.timeouts.implicit_wait = 3
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

    def esconder_teclado
        begin
            driver.hide_keyboard
        rescue Selenium::WebDriver::Error::UnknownError => error
            puts "Não foi possível esconder o teclado via hide_keyboard: #{error.message}"
        rescue StandardError => error
            puts "Erro ao esconder teclado: #{error.message}"
        end
    end
    
    def anexar_diagnostico_falha_allure(scenario)
        logs_dir = File.join(Dir.pwd, 'logs')
        FileUtils.mkdir_p(logs_dir)

        timestamp = Time.now.strftime('%Y%m%d_%H%M%S')
        scenario_name = scenario.name.gsub(/[^0-9A-Za-z]/, '_')
        temp_log = File.join(logs_dir, "#{timestamp}_#{scenario_name}_erro.txt")

        exception = scenario.exception

        activity_atual = nil
        package_atual = nil

        if sessao_valida?
            begin
            activity_atual = driver.current_activity
            rescue StandardError => e
            activity_atual = "Não foi possível obter current_activity: #{e.class} - #{e.message}"
            end

            begin
            package_atual = driver.current_package
            rescue StandardError => e
            package_atual = "Não foi possível obter current_package: #{e.class} - #{e.message}"
            end
        end

        conteudo = []
        conteudo << "CENÁRIO:"
        conteudo << scenario.name
        conteudo << ""
        conteudo << "STATUS:"
        conteudo << "FAILED"
        conteudo << ""
        conteudo << "ERRO:"
        conteudo << "#{exception.class} - #{exception.message}" if exception
        conteudo << ""
        conteudo << "ACTIVITY ATUAL:"
        conteudo << activity_atual.to_s
        conteudo << ""
        conteudo << "PACKAGE ATUAL:"
        conteudo << package_atual.to_s
        conteudo << ""
        conteudo << "BACKTRACE:"
        conteudo << exception.backtrace.first(20).join("\n") if exception&.backtrace

        File.write(temp_log, conteudo.join("\n"), encoding: 'UTF-8')

        Allure.add_attachment(
            name: "diagnostico_falha",
            type: Allure::ContentType::TXT,
            source: File.open(temp_log, 'rb')
        )
    end
end