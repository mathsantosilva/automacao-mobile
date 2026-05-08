require 'appium_lib'
require 'appium_lib_core'
require_relative '../config/constants'

class Gestures
  def deslizar(click_x, click_y, wait, move_x, move_y)
    driver
    .action
    .move_to_location(move_x, move_y)
    .pointer_down(:left)
    .move_to_location(click_x, click_y)
    .release
    .perform
  end

  def scroll_ate_elemento(xpath)

    tentativas = Constants::Gestures::SCROLL_ATTEMPTS
    tentativas_scroll_travado = Constants::Gestures::SCROLL_ATTEMPTS
    begin
      driver.manage.timeouts.implicit_wait = 0.5

      tentativas.times do
        elementos = find_elements(xpath: xpath)

        elemento_visivel = elementos.find do |elemento|
          elemento_visivel_na_area_util?(elemento)
        end


        return elemento_visivel if elemento_visivel

        scroll_executado = false

        tentativas_scroll_travado.times do
          page_source_antes = driver.page_source

          executar_scroll_para_baixo

          page_source_depois = driver.page_source

          if page_source_antes != page_source_depois
            scroll_executado = true
            break
          else
            sleep 1.0
          end
        end

        unless scroll_executado
          puts "A tela não mudou após #{tentativas_scroll_travado} tentativa(s) de scroll."
        end
      end

      raise Selenium::WebDriver::Error::NoSuchElementError, "Elemento não encontrado visível após scroll: #{xpath}"

    ensure
      driver.manage.timeouts.implicit_wait =  Constants::Timeouts::IMPLICIT_WAIT
    end
  end

  def scroll_simples_para_cima
    size = driver.window_size

    start_x = size.width / 2
    start_y = (size.height * 0.35).to_i
    end_y = (size.height * 0.75).to_i
    driver.action
          .move_to_location(start_x, start_y) 
          .pointer_down
          .move_to_location(start_x, end_y)
          .pointer_up
          .perform
  end

  def executar_scroll_para_baixo
    size = driver.window_size

    start_x = size.width / 2
    start_y = (size.height * 0.75).to_i
    end_y = (size.height * 0.35).to_i

    driver.action
          .move_to_location(start_x, start_y)
          .pointer_down
          .move_to_location(start_x, end_y)
          .pointer_up
          .perform
  end

  def area_util_app()
    begin
      content = driver.find_element(:xpath, '//android.widget.FrameLayout[@resource-id="android:id/content"]')
      rect = content.rect
      recuo_inferior = Constants::Gestures::BOTTOM_SAFE_MARGIN

      return {
        x: rect.x,
        y: rect.y,
        width: rect.width,
        height: rect.height - recuo_inferior,
        bottom: rect.y + rect.height - recuo_inferior,
        recuo_inferior: recuo_inferior,
        origem: 'android:id/content'
      }
    rescue StandardError => e
      puts "[AREA_UTIL] Não conseguiu obter android:id/content: #{e.class} - #{e.message}"
    end

    size = driver.window_size

    {
      x: 0,
      y: 0,
      width: size.width,
      height: size.height - recuo_inferior,
      bottom: size.height - recuo_inferior,
      recuo_inferior: recuo_inferior,
      origem: 'window_size'
    }
  end

  def elemento_visivel_na_area_util?(elemento, margem: 5)
    area = area_util_app
    rect = elemento.rect

    elemento_left = rect.x
    elemento_right = rect.x + rect.width
    elemento_top = rect.y
    elemento_bottom = rect.y + rect.height

    area_left = area[:x] + margem
    area_right = area[:x] + area[:width] - margem
    area_top = area[:y] + margem
    area_bottom = area[:bottom] - margem


    elemento.displayed? &&
      elemento_right > area_left &&
      elemento_left < area_right &&
      elemento_bottom > area_top &&
      elemento_top < area_bottom
  end
end