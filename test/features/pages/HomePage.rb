require_relative '../sections/ColoursGridSection'
require_relative '../sections/ColoursMainSection'
require_relative '../sections/ColoursSelectorSection'

class HomePage < SitePrism::Page
    set_url '/index.html'
    section :colours_main, ColoursMainSection, "div[id='colours-main']"
    section :colours_grid, ColoursGridSection, "div[id='colours-grid']"
    section :colours_selector, ColoursSelectorSection, "div[id='colours-selector']"

    def get_invalid_hex_prompt_text
        return 'Invalid hexadecimal data.  Try again.'
    end
end