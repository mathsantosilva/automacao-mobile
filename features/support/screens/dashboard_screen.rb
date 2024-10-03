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
end