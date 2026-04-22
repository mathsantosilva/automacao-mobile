class ManipuleNetwork 

    # Resposta do getConnectivity
    # {"wifi"=>true, "data"=>true, "airplaneMode"=>false}

    def get_network_atual
        con = driver.execute_script('mobile: getConnectivity')
        return con
    end

    def set_network_default
        status_net = get_network_atual()
        wifi = status_net["wifi"]
        data = status_net["data"]
        airplanemode = status_net["airplanemode"]
        if wifi != true or data != true or airplanemode == true
            driver.execute_script('mobile: setConnectivity', {
                wifi: true,    # Ativar Wi-Fi
                data: true,   # Ativar dados móveis
                airplaneMode: false  # Desativar modo avião
              })
        end
    end

    def set_modo_aviao
        driver.execute_script('mobile: setConnectivity', {
            wifi: false,    # Ativar Wi-Fi
            data: false,   # Ativar dados móveis
            airplaneMode: true  # Desativar modo avião
        })
    end
    
    def set_modo_manual(wifi, data, airplane)
        driver.execute_script('mobile: setConnectivity', {
            wifi: wifi,    # Ativar Wi-Fi
            data: data,   # Ativar dados móveis
            airplaneMode: airplane  # Desativar modo avião
        })
    end
end
