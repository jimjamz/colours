require 'cucumber'
require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'xpath'

Capybara.default_driver = :selenium
Capybara.app_host = 'http://localhost:8000/'