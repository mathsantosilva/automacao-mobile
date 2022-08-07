Before do
    ## Inicia a sessão do driver
    driver.start_driver
    ## aumenta o timeout para encontrar elementos
    driver.manage.timeouts.implicit_wait = 50

    # Instanciando as classes
    @login = LoginScreen.new
    @dash = DashboardScreen.new
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
  
    ## Finaliza a sessão do appium
    driver.quit_driver
  end
  