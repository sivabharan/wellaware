require_relative '../../src/pageObjects/abstract_page'

class AlertViewsPage < AbstractPage
  def initialize driver
    super(driver)
  end

#Inherits Abstract Page and includes methods to perform all actions on the Alert view Screen of the app.

  def click_text_entry
    $wait.until{ @@driver.find_element(name: 'Text Entry') }
    @@driver.find_element(name: 'Text Entry').click
    sleep 2 #Included sleep for the alert to load
    return AlertViewsPage.new(@@driver)
  end

  def capture_alert_title
    alert = @@driver.switch_to.alert
    title = alert.text
    puts title
    alert.accept
    return AlertViewsPage.new(@@driver)

  end

  def click_okay_cancel
    $wait.until { @@driver.find_element(name: 'Okay / Cancel') }
    @@driver.find_element(name: 'Okay / Cancel').click
    @@driver.switch_to.alert.accept
    return AlertViewsPage.new(@@driver)
  end

  def click_other_options
    $wait.until { @@driver.find_element(name: 'Other') }
    @@driver.find_element(name: 'Other').click
    return AlertViewsPage.new(@@driver)

  end

  def select_choice_two
    $wait.until { @@driver.find_element(name: 'Choice Two') }
    @@driver.find_element(name: 'Choice Two').click
    return AlertViewsPage.new(@@driver)
  end

  def click_ui_catalog
    $wait.until { @@driver.find_element(name: 'UICatalog') }
    @@driver.find_element(name: 'UICatalog').click
    return DatePickerPage.new(@@driver)
  end
end