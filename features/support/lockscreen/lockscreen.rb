class ManipuleScreen 
    def validscreenlock
        if driver.device_locked?
            driver.unlock
        end
    end
end