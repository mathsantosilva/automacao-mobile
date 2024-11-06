class Location
    # Santos Coordenadas
    # latitude -23.961667
    # longitude -46.332222    

    # Diadema Coordenadas
    # latitude -23.695694
    # longitude -46.627972   

    def get_location
        result = driver.location
        return result
    end
    def set_location(latitude, longitude)
        begin
            result = @driver.execute_script("mobile: shell", { command: "am start-foreground-service --user 0 -n io.appium.settings/.LocationService --es latitude #{latitude} --es longitude #{longitude}" })
        rescue
            return
        end
    end
    def location_default
        begin
            result = @driver.execute_script("mobile: shell", { command: "am stopservice --user 0 -n io.appium.settings/.LocationService" })
        rescue
            return
        end
    end    
end