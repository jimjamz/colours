require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'pp'
require 'rspec'
require 'selenium-webdriver'
require 'xpath'

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new app, browser: :chrome,
    options: Selenium::WebDriver::Chrome::Options.new(args: %w[ --headless ])
end

Capybara.register_driver :firefox do |app|
  Capybara::Selenium::Driver.new app, browser: :firefox,
    options: Selenium::WebDriver::Firefox::Options.new(args: %w[ --headless ])
end

# Capybara::Screenshot.register_driver :$BROWSER_CHOICE do |driver, path|
#   driver.browser.save_screenshot(path)
# end

Capybara.default_driver = :selenium
Capybara.javascript_driver = :selenium

Capybara.app_host = 'http://localhost:8080/'