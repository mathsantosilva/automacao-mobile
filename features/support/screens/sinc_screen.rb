class SincScreen
    def end_progress_bar_sinc
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(class_name: 'android.widget.ProgressBar')
                next
            rescue
                @driver.manage.timeouts.implicit_wait = 50
                return
            end
        end
    end

    def status_conexao_sinc
        @driver.manage.timeouts.implicit_wait = 1
        while true
            begin
                elemento = find_element(xpath: '//android.widget.RelativeLayout/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup/android.view.ViewGroup[3]/android.view.ViewGroup[1]/android.view.ViewGroup[2]/android.widget.TextView').text
                if elemento == 'ONLINE'
                    @driver.manage.timeouts.implicit_wait = 50
                    return
                else
                    next
                end
            end
        end
    end
end