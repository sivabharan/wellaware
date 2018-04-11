require_relative '../../src/pageObjects/abstract_page'
require_relative '../../src/pageObjects/wiki_continuous_delivery_page'

class WikipediaHomePage < AbstractPage

  def initialize driver
    super(driver)
  end

  def search_continious_delivery
    @@driver.manage.window.maximize

    @@driver.find_element(id: 'searchInput').send_keys('continuous delivery')
    @@driver.find_element(class: 'formBtn').click

    return WikiContinousDeliveryPage.new(@@driver)
  end


end