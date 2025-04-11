require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'pp'
require 'rspec'
require 'selenium-webdriver'
require 'webdrivers'
require 'xpath'

case ENV['BROWSER']
when 'firefox', 'ff'
  BROWSER_OPTIONS = Selenium::WebDriver::Firefox::Options
  DRIVER_CHOICE = :firefox
when 'librewolf'
  ENV['BROWSER']='firefox'
  Selenium::WebDriver::Firefox::Binary.path= '/usr/bin/librewolf'
  BROWSER_OPTIONS = Selenium::WebDriver::Firefox::Options
  DRIVER_CHOICE = :firefox
when 'chrome'
  # for old webdriver gems (hardcoded to use the old chromedriver site), which 
  # use the newer chromedriver, manually download and copy the new chromedriver
  # to ~/.webdrivers and put the version number in ~/.webdrivers/chromedriver.version
  # then specify the (same) required chromedriver version as below
  Webdrivers::Chromedriver.required_version='135.0.7049.42'
  BROWSER_OPTIONS = Selenium::WebDriver::Chrome::Options
  DRIVER_CHOICE = :chrome
else
  BROWSER_OPTIONS = :null
  DRIVER_CHOICE = :selenium
end

Capybara.register_driver ENV['BROWSER'].to_sym do |app|
  Capybara::Selenium::Driver.new app, browser: ENV['BROWSER'].to_sym,
    options: BROWSER_OPTIONS.new(args: [ ENV['HEADLESS_OPTION'] ])
end
Capybara::Screenshot.register_driver :selenium do |driver, path|
  driver.browser.save_screenshot(path)
end

Capybara.default_driver = DRIVER_CHOICE
Capybara.javascript_driver = DRIVER_CHOICE

Capybara.app_host = 'http://localhost:8080/'
# run another HTTP server on 3030 for screenshots that include CSS
Capybara.asset_host = 'http://localhost:3030'
Capybara.save_path = "./screenshots"
Capybara::Screenshot.prune_strategy = :keep_last_run
