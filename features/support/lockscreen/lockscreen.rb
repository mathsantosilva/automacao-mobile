class ManipuleScreen 
    def validscreenlock
        lock = driver.execute_script("mobile: isLocked")
        if lock
            driver.unlock
        end
    end
end