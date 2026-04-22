require 'appium_lib'
require 'appium_lib_core'

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
end