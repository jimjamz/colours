require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'pp'
require 'rspec'
require 'selenium-webdriver'
require 'xpath'

case ENV['BROWSER']
when 'firefox', 'ff'
  BROWSER_OPTIONS = Selenium::WebDriver::Firefox::Options
  DRIVER_CHOICE = :firefox
when 'chrome'
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
Capybara.save_path = "screenshots"
Capybara::Screenshot.prune_strategy = :keep_last_run