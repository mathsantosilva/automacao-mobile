Before do

  ## Inicia a sessão do driver
  driver.start_driver

  ## aumenta o timeout para encontrar elementos
  driver.manage.timeouts.implicit_wait = 50

  # Instanciando as classes
  @login = LoginScreen.new
  @dash = DashboardScreen.new
  @net = ManipuleNetwork.new
  @sinc = SincScreen.new
  @marc = MarcScreen.new

  # Seta a internet do dispositivo como 6: Wi-Fi e dados móveis (ALL_NETWORK_ON)
  @net.set_network_default

  end
  
After do |scenario|
  ## Após terminar um cenario ele tira uma screenshot no formato base64
  binary_shot = driver.screenshot_as(:base64)

  ## caminho temporario do screenshot
  temp_shot = "logs/temp_shot.png"

  ## Transforma de binario em arquivo
  File.open(temp_shot, "wb") do |f|
    f.write(Base64.decode64(binary_shot).force_encoding("UTF-8"))
  end
  
  ## anexa a screenshot
  Allure.add_attachment(
    name: "screenshot",
    type: Allure::ContentType::PNG,
    source: File.open(temp_shot),
  )
  driver.terminate_app('com.mobile.kairos')
  ## Finaliza a sessão do appium
  driver.quit
end
  