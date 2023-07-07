// import { hex2rgb } from '../support/helpers';
const { Given, When, Then, AfterAll } = require('@cucumber/cucumber');
const assert = require('assert')
const { Builder, By, Key, until } = require('selenium-webdriver');

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
  await driver.get('http://localhost:8080/index.html');
  driver.wait(until.elementLocated(By.id('colours-selector')));
});

When('I select the colour {string}', async function (colour) {
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
      //rgb_colour is still a string literal at this point, not a regular expression
      //needs to be converted in order to be a matcher for assertions
      rgb_colour = new RegExp(hex2rgb(colour));
      colour = 'custom';
      break;
  }

  let selected_colour = await driver.findElement(By.id('selected-colour-' + colour))
    .getCssValue("background-color")
    .then(function(selected_colour) {
      assert(selected_colour.match(rgb_colour));
  });
});

Then(/^I should see the text "(.*?)"$/, async function (expected_text) {
  let page_text = await driver.findElement(By.tagName('p')).getText();
  assert.equal(expected_text + ".", page_text);
});

Given(/^(?:the custom colour text box is available|custom colours can be created)$/, async function () {
  await driver.findElement(By.id('colourpicker'));
});

When(/^I (?:enter|try to create) the(?: custom)? colour "(.*?)"/, async function (colour) {
// Cucumber-js returns a null object for the empty string example in the invalid colour scenario 
  if (Object.is(colour, null)) {
    // re-assign the null value back to a an empty string
    colour = '';
};
await driver.findElement(By.id('colourpicker')).sendKeys(colour);
});

When('the custom colour is validated', async function () {
  await driver.findElement(By.id('colourpicker')).sendKeys(Key.TAB);
});

Then('the valid custom colour can be submitted', async function () {
  await driver.findElement(By.id('submit')).click();
});

When(/^I create the(?: custom)? colour "(.*?)"/, async function (colour) {
  await driver.findElement(By.id('colourpicker'))
    .sendKeys(colour, Key.TAB);
  await driver.findElement(By.id('submit')).click();
});

Then('I should be informed that the colour is not valid', async function () {
  await driver.findElement(By.id('colourpicker')).sendKeys(Key.TAB);
  await driver.wait(until.alertIsPresent());
  // get the alert pop-up element
  let alert = await driver.switchTo().alert();
  let alertText = await alert.getText();
  assert.equal(alertText, 'Invalid hexadecimal data.  Try again.');
  // click OK once the alert pop-up text is verified
  await alert.accept();
});

Then('the invalid custom colour cannot be submitted', async function () {
  // verify whether the custom colour input 'submit' button is displayed
  let custom_colour_submit = await driver.findElement(By.id('submit')).isDisplayed();
  if (custom_colour_submit) {
    assert(false);
  }
  else {
    assert(true);
  }
});

Then(/^I should be (?:on|returned to) the "(.*?)" page$/, async function (visited_page) {
  if (visited_page == 'home') {
    visited_page = 'index';
  };
  let url = await driver.getCurrentUrl();
  assert(url.includes(visited_page));
});

Then('I should see the custom colour text {string}', async function (expected_text) {
  let custom_colour_input = await driver.findElement(By.id('colourpicker')).getAttribute('value');
  assert.equal(expected_text, custom_colour_input);
});

Then('I should not see the custom colour text {string}', async function (expected_text) {
  let custom_colour_input = await driver.findElement(By.id('colourpicker')).getAttribute('value');
  assert.notEqual(expected_text, custom_colour_input);
});

AfterAll(async function(){
  await driver.quit();
});
