require_relative '../../src/pageObjects/abstract_page'
class SauceLabsPage < AbstractPage

  def initialize driver
    super(driver)
  end

  def select_options_automated_configurator
    @@driver.manage.window.maximize

    @@driver.find_element(:css, 'div.api-button').click
    $wait.until{@@driver.find_element(:css, "button[class='btn btn-default btn-display select-logo select-a-device']")}
    @@driver.find_element(:css, "button[class='btn btn-default btn-display select-logo select-a-device']").click

    @@driver.find_element(:css, 'div#desktop div div div').click
    @@driver.find_element(:css, "button[class='btn btn-default btn-display select-logo select']").click

    @@driver.find_element(:css, 'div#operating-system div:nth-of-type(5) div').click

    $wait.until { @@driver.find_element(:css, "button[class='btn btn-default btn-display select-logo select-a-browser']") }
    @@driver.find_element(:css, "button[class='btn btn-default btn-display select-logo select-a-browser']").click
    @@driver.find_element(:class, 'firefox').click

    @@driver.find_element(:css, "div#firefox div:nth-of-type(2) div:nth-of-type(1) div").click
    @@driver.find_element(:css, "div[class='spc-item choice-options clearfix col-md-12'] spc-options-toggle").click

    @@driver.find_element(:css, "label[for='box1']").click
    @@driver.find_element(:css, "div[class='configurator-code-caps'] ul li:nth-of-type(5) a").click

    configurations = @@driver.find_element(:id, 'tab-ruby').text
    return configurations





  end
end