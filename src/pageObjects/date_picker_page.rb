require_relative '../../src/pageObjects/abstract_page'
class DatePickerPage < AbstractPage
  def initialize driver
    super(driver)
  end

  def click_date_picker
    @@driver.find_element(name: 'Date Picker').click
    sleep 5
    return DatePickerPage.new(@@driver)

  end

  def change_date
    date = Date.today + 7
    # date = Date.today >> 1 # to forward date by 1 month
    future_date = date.strftime('%a %b %e')
    puts future_date
    @@driver.find_element(xpath: '//UIAPickerWheel[1]').send_keys future_date

    day_session = @@driver.find_element(xpath: '//UIAPickerWheel[4]').text

    if day_session == 'AM'
      @@driver.find_element(xpath: '//UIAPickerWheel[4]').send_keys 'PM'
    else
      @@driver.find_element(xpath: ' //UIAPickerWheel[4]').send_keys 'AM'

    end

    return DatePickerPage.new(@@driver)
  end

  def click_ui_catalog
    @@driver.find_element(name: 'UICatalog').click
    sleep 3 # Sleep added to see that UIcatalog is clicked as this is the last step.
  end
end