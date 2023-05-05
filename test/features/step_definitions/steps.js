// import { hex2rgb } from '../support/helpers';
const { Given, When, Then, AfterAll } = require('@cucumber/cucumber');
const { strict } = require('assert');
const assert = require('assert')
const { Builder, By, Key, until } = require('selenium-webdriver')

// let helpers = require('../support/helpers');
require ("geckodriver");
require ("chromedriver");

// create web driver
const driver = new Builder().forBrowser('firefox').build();

function scan(str, regex) {
  if (!regex.global) {
      throw new Error("A regex without the global (/g) flag is not supported.");
  }
  var result = [];
  var m;
  while (m = regex.exec(str)) {
      if (m.length >= 2) {
          result.push(m.slice(1));
      } else {
          result.push(m[0]);
      }
  }
  return result;
};

function hex2rgb(in_hex) {
  // if the input is 3-digit hexadecimal notation
  if (in_hex.length < 6) {
    // expand to a 6-digit hexadecimal
    let s = [];
    // split the string by each character and for each ...
    in_hex.split('').forEach(function(x) {
      // ... push it twice onto the new array
      s.push(x, x);
    })
    in_hex = s.join('');
  }
  
  // convert each of the 3 hexadecimal pairs into a denary integer
  // no scan method in Javascript like Ruby. Crafted my own.
  let t = scan(in_hex, /../g).map(x => parseInt(x, 16));
  // needs to be a string literal here, not a regex
  // because the 3 hexadecimal pairs need to be interpolated.
  const out_rgb = `rgba?\\(${t[0]}, ${t[1]}, ${t[2]}(, 1)?\\)`;
  return out_rgb;
};

Given('I am on the home page', async function () {
  await driver.get('http://localhost:8080');
  driver.wait(until.elementLocated(By.id('colours-selector')));
});

When('I select the colour {string}', async function (colour) {
  //var colourCells = await driver.findElements(By.className('colour-cell'));
  await driver.findElement(By.id('colour-cell-' + colour)).click();
});

Then('I am navigated to the {string} colour page', async function (colour) {
  title = await driver.getTitle()
  .then(function(title) {
    assert.equal(title, colour);
  });
});

Then('I should see the colour {string}', async function (colour) {
  switch (colour) {
    case 'red':
      rgb_colour = /rgba?\(255, 0, 0(, 1)?\)/
      break;
    case 'green':
      rgb_colour = /rgba?\(0, 255, 0(, 1)?\)/
      break;
    case 'blue':
      rgb_colour = /rgba?\(0, 0, 255(, 1)?\)/
      break;
    default:
      //rgb_colour is still a string literal, not a regular expression
      //needs to be converted to be a matcher for assertions
      rgb_colour = new RegExp(hex2rgb(colour));
      colour = 'custom';
      break;
  }

  let selected_colour = await driver.findElement(By.id('selected-colour-' + colour)).getCssValue("background-color")
  .then(function(selected_colour) {
    assert(selected_colour.match(rgb_colour));
  });
});

Then(/^I should see the text "(.*?)"$/, async function (expected_text) {
  let page_text = await driver.findElement(By.tagName('p')).getText();
  assert.equal(expected_text + ".", page_text)
});

Given(/^(?:the custom colour text box is available|custom colours can be created)$/, async function () {
  await driver.findElement(By.id('colourpicker'));
});

When(/^I (?:enter|try to create) the(?: custom)? colour "(.*?)"/, async function (colour) {
//When(/^I (?:enter|try to create) the colour "(.*?)"/, async function (colour) {
await driver.findElement(By.id('colourpicker')).sendKeys(colour);
});

When('the custom colour is validated', async function () {
  // await driver.findElement(By.id('colourpicker')).sendKeys('\uE004');
  await driver.findElement(By.id('colourpicker')).sendKeys(Key.TAB);
});

Then('the valid custom colour can be submitted', async function () {
  await driver.findElement(By.id('submit')).click();
});

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

AfterAll(async function(){
  await driver.quit();
});
