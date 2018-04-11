require 'rspec'
require 'selenium-webdriver'

class AbstractPage
  @@driver = nil
  $wait = Selenium::WebDriver::Wait.new(:timeout => 10) # seconds
  def initialize driver
    @@driver = driver
  end

  def navigate_to_saucelabs
    @@driver.navigate.to "https://docs.saucelabs.com/reference/platforms-configurator/?_ga=1.5883444.608313.1428365147#/"
    return SauceLabsPage.new(@@driver)
  end

  def navigate_to_wikipedia
   @@driver.navigate.to "https://www.wikipedia.org/"
   return WikipediaHomePage.new(@@driver)
  end

  def ui_catalog
    return UICatalogHomePage.new(@@driver)
  end

  def alerts_view
    return AlertViewsPage.new(@@driver)
  end

  def date_picker
    return DatePickerPage.new(@@driver)
  end

  def quit
    @@driver.quit
  end


end