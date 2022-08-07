# Relatorios no formato Json
require "allure-cucumber"
# Subir uma instancia do appium e le os capabilities
require "appium_lib"
require "appium_lib_core"
# Limpar os logs e screenshots
require "fileutils"

# Limpa os logs e os screenshots
FileUtils.rm_f(Dir.glob("logs/*.json"))
FileUtils.rm_f(Dir.glob("logs/*.png"))


# Carrega os Capabilities da pasta caps
caps = Appium.load_appium_txt file: File.expand_path("caps/android.txt", __dir__), verbose: true
# Levanta uma instancia do driver do appium passando o capabilities 
Appium::Driver.new(caps, true)
# Passando os metodos do appium para o cucumber
Appium.promote_appium_methods Object
