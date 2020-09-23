require_relative '../sections/ColoursGridSection'
require_relative '../sections/ColoursMainSection'

class ColourPage < SitePrism::Page
    set_url '/{color}.html'
    section :colours_main, ColoursMainSection, "div[id='colours-main']"
    section :colours_grid, ColoursGridSection, "div[id='colours-grid']"
end