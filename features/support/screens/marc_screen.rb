class MarcScreen
    @@meses = {
        "JANEIRO" => "January", "FEVEREIRO" => "February", "MARÇO" => "March",
        "ABRIL" => "April", "MAIO" => "May", "JUNHO" => "June",
        "JULHO" => "July", "AGOSTO" => "August", "SETEMBRO" => "September",
        "OUTUBRO" => "October", "NOVEMBRO" => "November", "DEZEMBRO" => "December"
    }
    @@dias_semana = {
        "SEG." => "Mon.", "TER." => "Tue.", "QUA." => "Wed.",
        "QUI." => "Thu.", "SEX." => "Fri.", "SÁB." => "Sat.", "DOM." => "Sun."
    }


    def get_relogio
        caminho_relogio = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
        hora_relogio = find_element(xpath: "#{caminho_relogio.to_s}").text
        return hora_relogio
    end

    def get_ultima_marc
        caminho_ult_marc = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[9]/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView'
        ult_marc = find_element(xpath: "#{caminho_ult_marc.to_s}").text
        @@dias_semana.each { |pt, en| ult_marc.gsub!(pt, en) }
        @@meses.each { |pt, en| ult_marc.gsub!(pt, en) }
        data_formatada = DateTime.strptime(ult_marc, "%a. %d %B %H:%M")
        data_atual = data_formatada < Date.today
        if data_atual
            ult_marc = '00:00'
        else
            ult_marc = ult_marc.split(" ")
            ult_marc = ult_marc[3]
        end

        return ult_marc
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
end