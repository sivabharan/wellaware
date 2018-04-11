require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/alert_views_page'
require_relative '../../src/pageObjects/date_picker_page'

class UICatalogHomePage < AbstractPage

  def initialize driver
    super(driver)
  end

  def click_alert_Views

    @@driver.find_element(name: 'Alert Views').click
    return AlertViewsPage.new(@@driver)
    sleep 5
  end

  def click_date_picker
    @@driver.find_element(name: 'Date Picker').click
    return DatePickerPage.new(@@driver)
    sleep 5
  end

end