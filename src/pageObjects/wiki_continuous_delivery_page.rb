require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/test_automation_page'
class WikiContinousDeliveryPage < AbstractPage

  def initialize driver
    super(driver)
  end

  def click_continuous_delivery_image


    $wait.until { @@driver.find_element(css: "a[href='/wiki/File:Continuous_Delivery_process_diagram.png']") }
    @@driver.find_element(css: "a[href='/wiki/File:Continuous_Delivery_process_diagram.png']").click
    # @@driver.find_element(class: 'image').click

    return WikiContinousDeliveryPage.new(@@driver)
  end

  def close_continuous_delivery_process_diagram
    $wait.until { @@driver.find_element(class: 'mw-mmv-close') }
    puts @@driver.find_element(class: 'mw-mmv-close').click
    # @@driver.send_keys :escape
    return WikiContinousDeliveryPage.new(@@driver)
  end
 def click_automated_testing_link
   $wait.until{@@driver.find_element(link_text: 'automated testing')}
   @@driver.find_element(link_text: 'automated testing').click
   return TestAutomationPage.new(@@driver)
 end



end


