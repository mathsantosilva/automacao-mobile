class Location
    # Santos Coordenadas
    # latitude -23.961667
    # longitude -46.332222    

    # Diadema Coordenadas
    # latitude -23.695694
    # longitude -46.627972   

    def getlocation
        result = @driver.execute_script("mobile: shell", { command: "get_location" })
        return result
    end
    def set_location(latitude, longitude)
        
        result = @driver.execute_script("mobile: shell", { command: "am start-foreground-service --user 0 -n io.appium.settings/.LocationService --es latitude #{latitude} --es longitude #{longitude}" })
    end
    def location_default
        result = @driver.execute_script("mobile: shell", { command: "am stopservice --user 0 -n io.appium.settings/.LocationService" })
    end    
end