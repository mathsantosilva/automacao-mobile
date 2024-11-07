class MarcScreen
    @@meses = {
        "Janeiro" => "January", "Enero" => "January",
        "Fevereiro" => "February", "Febrero" => "February",
        "Março" => "March", "Marzo" => "March",
        "Abril" => "April",
        "Maio" => "May", "Mayo" => "May",
        "Junho" => "June", "Junio" => "June",
        "Julho" => "July", "Julio" => "July",
        "Agosto" => "August",
        "Setembro" => "September", "Septiembre" => "September",
        "Outubro" => "October", "Octubre" => "October",
        "Novembro" => "November", "Noviembre" => "November",
        "Dezembro" => "December", "Diciembre" => "December"
      }
      
      @@dias = {
        "Domingo" => "Sunday",
        "Segunda-feira" => "Monday", "Lunes" => "Monday",
        "Terça-feira" => "Tuesday", "Martes" => "Tuesday",
        "Quarta-feira" => "Wednesday", "Miércoles" => "Wednesday",
        "Quinta-feira" => "Thursday", "Jueves" => "Thursday",
        "Sexta-feira" => "Friday", "Viernes" => "Friday",
        "Sábado" => "Saturday"
      }
      ## JUE.. 19 SEPTIEMBRE 12:1

      def get_ultima_marc()
        caminho_ult_marc = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[9]/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView'
        ult_marc = find_element(xpath: "#{caminho_ult_marc.to_s}").text
      
        if ult_marc != ' '
            puts ult_marc
            # Substitui meses
            @@meses.each { |original, ingles| ult_marc.gsub!(original, ingles) }
            puts ult_marc
            # Substitui dias
            @@dias.each { |original, ingles| ult_marc.gsub!(original, ingles) }
            puts ult_marc
            # Abrevia o dia da semana para 3 letras
            ult_marc.gsub!(/\b(\w+)\b/) do |match|
                Date::ABBR_DAYNAMES.include?(match) ? match[0, 3] + "." : match
            end
            puts ult_marc
            data_formatada = DateTime.strptime(ult_marc, "%a. %d %B %H:%M")
            ult_marc = data_formatada < Date.today ? '00:00' : data_formatada.strftime("%H:%M")
        end
      end

      
    def get_relogio
        caminho_relogio = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
        hora_relogio = find_element(xpath: "#{caminho_relogio.to_s}").text
        return hora_relogio
    end
    
    def valida_hora_marc
        while true
            hora_str = get_relogio()
            if hora_str == '--:--'
                next
            end
            ult_marc_str = get_ultima_marc()
            if hora_str != "" and hora_str != nil
                hora = Time.parse(hora_str)
            else
                next
            end
            if ult_marc_str != "" and ult_marc_str != nil
                ult_marc = Time.parse(ult_marc_str)
            else
                return
            end
            if hora > ult_marc
                return
            else
                next
            end
        end
    end
    def valida_pop_multiuser
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                puts "popup"
                popup = '//android.widget.TextView[@resource-id="android:id/message"]'
                text = find_element(xpath: "#{popup}").text
                find_element(xpath: "//android.widget.Button[@resource-id='android:id/button1']").click
                @driver.manage.timeouts.implicit_wait = 50
                return
            rescue
                next
            end
        end
    end
    def valida_camera_open
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                puts "camera"
                camera = '//android.widget.FrameLayout[@resource-id="android:id/content"]/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView'
                text = find_element(xpath: "#{popup}")
                next
            rescue
                puts "rescue"
                @driver.manage.timeouts.implicit_wait = 50
                return
            end
        end
    end
end