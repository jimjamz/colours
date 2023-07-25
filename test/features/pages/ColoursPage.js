const Page = require('./page.js');

class ColoursPage extends Page {
  
  get panelColoursSelector () {
    return $('#colours-selector');
  }

  get red_colour_cell () {
    return $("div[id='colour-cell-red']");
  }

  get green_colour_cell () {
    return $("div[id='colour-cell-green']");
  }

  get blue_colour_cell () {
    return $("div[id='colour-cell-blue']");
  }

  open () {
    return super.open('/');
  }

  async click_colour_cell(colour) {
    eval('await this.' + colour + '_colour_cell.click();');
  }
}


module.exports = {
  ColoursPage
}
