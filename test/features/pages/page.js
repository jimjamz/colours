const { Browser } = require("selenium-webdriver");
const { app } = require("../../../app.js");

class Page {
  get path() {
    return this.path;
  }
  
  browser = new Browser;

  open (path) {
    return this.browser.url(`http://${hostname}:${port}`);
  }
}

module.exports = {
  Page
}