require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'
require 'xpath'

# Capybara.default_driver = :selenium
Capybara.default_driver = :poltergeist
Capybara.app_host = 'http://localhost:8000/'