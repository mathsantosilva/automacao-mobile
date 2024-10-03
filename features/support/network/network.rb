class ManipuleNetwork 
    # 0: Sem conexão (NO_CONNECTION)
    # 1: Somente avião (AIRPLANE_MODE)
    # 2: Somente Wi-Fi (WIFI_ONLY)
    # 4: Somente dados móveis (DATA_ONLY)
    # 6: Wi-Fi e dados móveis (ALL_NETWORK_ON)

    def get_network_atual
        status_net = driver.get_network_connection()
        return status_net
    end
    def set_network_default
        status_net = driver.get_network_connection()
        if status_net != 6
            driver.set_network_connection(6)
        end
    end
    def set_modo_aviao
        status_net = driver.get_network_connection()
        if status_net != 1
            driver.set_network_connection(1)
        end
    end
    def set_modo_manual(modo)
        driver.set_network_connection(modo)
        status_net = driver.get_network_connection()
    end
end
