require 'rspec'
require 'selenium-webdriver'
require_relative '../src/pageObjects/ui_catalog_home_page'

describe 'launches appium ios simulator and performs actions' do
  app = nil
  before :each do
    capabilities = {
        'platformVersion' => '8.3',
        'deviceName' => "iPhone 5s",
        'platformName' => "ios",
        'app' => '/Users/vdurbhakula/Desktop/UICatalog.app'
    }

    app = AbstractPage.new(Selenium::WebDriver.for(:remote,
                                                   desired_capabilities: capabilities,
                                                   url: "http://127.0.0.1:4723/wd/hub"))
  end


  after :each do
    #finally close app server
    app.quit
  end


  it 'should Launch Appium Server , Open UI Catalog app and Perform Operations' do

    app.ui_catalog.
        click_alert_Views.
        click_text_entry.
        capture_alert_title.
        click_okay_cancel.
        click_other_options.
        select_choice_two.
        click_ui_catalog.
        click_date_picker.
        change_date.click_ui_catalog

  end
end