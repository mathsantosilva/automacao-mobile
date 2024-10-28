class ManipuleNetwork 
    # 0: Sem conexão (NO_CONNECTION)
    # 1: Somente avião (AIRPLANE_MODE)
    # 2: Somente Wi-Fi (WIFI_ONLY)
    # 4: Somente dados móveis (DATA_ONLY)
    # 6: Wi-Fi e dados móveis (ALL_NETWORK_ON)

    def get_network_atual
        teste = driver.execute_script('mobile: getConnectivity')
        puts teste
        status_net = get_network_connection()
        puts status_net
        return status_net
    end

    def set_network_default
        status_net = get_network_atual()
        puts status_net.to_s != '6'
        if status_net.to_s == '6'
            driver.execute_script('mobile: setConnectivity', {
                wifi: true,    # Ativar Wi-Fi
                data: true,   # Desativar dados móveis
                airplaneMode: false  # Desativar modo avião
              })
        end
    end

    def set_modo_aviao
        status_net = get_network_atual()
        if status_net.to_s != '1'
            driver.set_network_connection(1)
        end
    end
    
    def set_modo_manual(modo)
        driver.set_network_connection(modo)
        status_net = get_network_atual()
    end
end
