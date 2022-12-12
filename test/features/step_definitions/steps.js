const { Given, When, Then, After } = require('@cucumber/cucumber');
const { strict } = require('assert');
const assert = require('assert')
// const { colours } = require('../../..')
const { Builder, By, until } = require('selenium-webdriver')

Given('I am on the home page', async function () {
  this.driver = new Builder()
  .forBrowser('firefox')
  .build();

  this.driver.wait(until.elementLocated(By.tagName('form')));
  await this.driver.get('https://localhost:8080');
});

When('I select the colour {string}', async function (colour) {
  //var colourCells = await this.driver.findElements(By.className('colour-cell'));
  await this.driver.findElement(By.Id('colour-cell-' + colour)).click();
});

Then('I am navigated to the {string} colour page', async function (titleMatch, next) {
  await this.driver.findElement(By.xpath('//div[contains(text(), ' + string + ')]'))
  this.driver.getTitle()
  .then(function(title) {
    assert.equal(title, titleMatch, next, 'Expected title to be ' + titleMatch);
  })
});

Then('I should see the colour {string}', async function (colour) {
  await this.driver.findElement(By.css('div#colours-grid div#selected-colour-' + colour))
  .then(function(css) {
    assert.equal(css, colour);
  })
});

Then(/^'I should see the text {string}'$/, function (page_text) {
  assert.equal(strict, page_text)
});

Given(/^(?:'the custom colour text box is available'|'custom colours can be created)'$/, async function () {
  await this.driver.findElement(By.Id('colourpicker'));
});

When(/^I (?:'enter|try to create) the(?: custom)? colour {string}'$/, async function (colour) {
    await this.driver.findElement(By.Id('colourpicker')).clear().sendKeys(colour);
  end
end
});
// When('the custom colour is validated') do
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Then('the valid custom colour can be submitted') do
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Given('custom colours can be created') do
//   pending # Write code here that turns the phrase above into concrete actions
// end

// When('I create the custom colour {string}') do |string|
//   pending # Write code here that turns the phrase above into concrete actions
// end

// When('I try to create the custom colour {string}') do |string|
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Then('I should be informed that the colour is not valid') do
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Then('the invalid custom colour cannot be submitted') do
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Then('I should be returned to the {string} page') do |string|
//   pending # Write code here that turns the phrase above into concrete actions
// end

// When('I try to create the custom colour {string}$%&*{string}') do |string, string2|
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Then('I should see the custom colour text {string}') do |string|
//   pending # Write code here that turns the phrase above into concrete actions
// end

// Then('I should not see the custom colour text {string}') do |string|
//   pending # Write code here that turns the phrase above into concrete actions
// end

After(async function () {
  this.driver.close();
});
})