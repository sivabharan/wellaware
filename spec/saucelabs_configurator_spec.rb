require 'rspec'
require 'selenium-webdriver'
require_relative '../src/pageObjects/sauce_labs_page'

describe 'test webdriver' do
  app = nil
  before :each do
    #create a web-driver driver
    app = AbstractPage.new(Selenium::WebDriver.for(:firefox))

  end
  after :each do
    #finally close the browser
    app.quit
  end
  it 'Launches Sauce Lab Configurator page select the required options and verifies the selections made' do


    configurations = app.navigate_to_saucelabs.select_options_automated_configurator
    puts configurations
    configuration_expected_browser = 'caps = Selenium::WebDriver::Remote::Capabilities.firefox'
    configuration_expected_platform = "caps['platform'] = 'Linux'"
    configuration_expected_version = "caps['version'] = '28.0'"
    configuration_expected_video = "caps['recordVideo'] = false"

    expect(configurations).to include(configuration_expected_browser && configuration_expected_platform && configuration_expected_version && configuration_expected_video)


  end
end