require 'cucumber'
require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'rspec'
require 'selenium-webdriver'
require 'xpath'

# 'selenium' as default driver for geckodriver
# Capybara.default_driver = :selenium
# 'poltergiest' as default driver for Travis-CI
Capybara.default_driver = :poltergeist
Capybara.javascript_driver = :poltergeist
Capybara.app_host = 'http://localhost:8080/'