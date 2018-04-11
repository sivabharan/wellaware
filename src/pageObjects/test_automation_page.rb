require_relative '../../src/pageObjects/abstract_page'

class TestAutomationPage < AbstractPage

  def initialize driver
    super(driver)
  end

  def validate_header_text

    $wait.until {@@driver.find_element(id: 'Overview')}
    overview_header = @@driver.find_element(id: 'Overview').text

    cd_testing = @@driver.find_element(id: 'Code-driven_testing').text
    return overview_header,cd_testing

  end
end