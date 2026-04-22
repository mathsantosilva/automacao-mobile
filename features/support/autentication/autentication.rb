class Autentication 
    def use_finger_print(dedo)
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(xpath: '//android.widget.TextView[@resource-id="com.android.systemui:id/title"]')
                if elemento
                    @driver.manage.timeouts.implicit_wait = 50
                    sleep 2
                    @driver.execute_script('mobile: fingerprint', { fingerprintId: dedo })
                    return
                else
                    next
                end
            rescue
                next
            end
        end
    end
end