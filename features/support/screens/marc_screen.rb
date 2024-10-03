class MarcScreen
    def get_relogio
        caminho_relogio = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup/android.view.ViewGroup/android.widget.TextView'
        hora_relogio = find_element(xpath: "#{caminho_relogio.to_s}").text
        return hora_relogio
    end
    def get_ultima_marc
        caminho_ult_marc = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[9]/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.TextView'
        ult_marc = find_element(xpath: "#{caminho_ult_marc.to_s}").text
        ult_marc = ult_marc.split(" ")
        return ult_marc[3]
    end
    def valida_hora_marc
        while true
            hora_str = get_relogio()
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