require 'timeout'

def looping
    while true
        puts 'seila'
    end
end

def teste
    begin
        Timeout.timeout(5) do
            looping()
        end
    rescue Timeout::Error
        puts "demorou"
    end

end

teste()