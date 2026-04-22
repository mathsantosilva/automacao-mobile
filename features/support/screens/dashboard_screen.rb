class DashboardScreen
    def namepeolpe
        find_element(xpath: "/hierarchy/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.widget.TextView").text
    end
    
    def closed_save_password
        @driver.manage.timeouts.implicit_wait = 1
        sleep 1
        begin
            find_element(id: "android:id/autofill_save_no").click 
        rescue
            @driver.manage.timeouts.implicit_wait = 50
            return
        end
    end

    def end_load_widget
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                widget = '//android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[2]/android.view.ViewGroup[1]/android.view.ViewGroup[1]/android.view.ViewGroup/android.widget.ImageView'
                find_element(xpath: "#{widget}")
                @driver.manage.timeouts.implicit_wait = 50
                return
            rescue
                next
            end
        end
    end
    def valida_pop_sinc_marcs
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                popup = '//android.widget.TextView[@resource-id="android:id/message"]'
                text = find_element(xpath: "#{popup}").text
                find_element(xpath: "//android.widget.TextView[@resource-id='android:id/message']").click
                @driver.manage.timeouts.implicit_wait = 50
                next
            rescue
                return
            end
        end
    end
end