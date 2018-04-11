require 'rspec'
require 'selenium-webdriver'
require_relative '../src/pageObjects/wikipedia_home_page'

describe 'Navigates to wikipedia and perform search action' do
  app = nil
  before :each do
    #create a web-driver driver
    # specify the browser(*iexplore,safari) we want to run and it runs on the local machine
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))

    #To run on remote machine - Specify the browser on which the test is expected to run and specify the remote host.
    # app = AbstractPage.new(Selenium::WebDriver.for(:remote,
    #                                                desired_capabilities: capabilities,
    #                                                url: "http://127.0.0.1:4723/wd/hub"))
    # app = AbstractPage.new(Selenium::WebDriver.for(:remote, :desired_capabilities => :chrome))

  end
  after :each do
    #finally closing the browser
    app.quit
  end
  it 'should Navigate to Wikipedia search for cointinous delivery and perform actions' do

   header_values =  app.navigate_to_wikipedia.
       search_continious_delivery.
       click_continuous_delivery_image.
       close_continuous_delivery_process_diagram.
       click_automated_testing_link.validate_header_text

expect(header_values).to include('Overview' && 'Code-driven testing')
  end
end