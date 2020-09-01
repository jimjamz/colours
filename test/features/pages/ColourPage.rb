require 'rspec'

class ColourPage < SitePrism::Page
    set_url '/{color}.html'
    element :colour_text, "div#colours-platform div#colours-main p"
    element :selected_colour_red, "div[id='selected-colour-red']"
    element :selected_colour_green, "div[id='selected-colour-green']"
    element :selected_colour_blue, "div[id='selected-colour-blue']"
    element :selected_colour_custom, "div[id='selected-colour-custom']"
    element :colour_style, :css, "div[class='colour-cell']"
    element :colourpicker_text_box, "input[id='colourpicker']"
    element :colourpicker_submit_button, "input[id='submit']"
    element :back_button, "div[id='go-back']"
    #section :colours_main, ColoursMainSection, "div[id='colours-main']"
    #section :colours_grid, ColoursGridSection, "div[id='colours-grid']"

    # def validate_page(text)
        # expect(@colour_page).to be_displayed
        # expect(@colour_page.title).to include(text)
    # end

    # def validate_colour_text(text)
        # within(colours_main) do
            # has_colour_text?
        # end
    # end

    def validate_colour_cell(colour)
        send("has_selected_colour_#{colour}?")
    end

    def enter_custom_colour_text(hex_colour)
        colourpicker_text_box.set hex_colour
    end

    def get_custom_colourpicker_value
        return colourpicker_text_box.value
    end

    def submit_custom_colour
        colourpicker_submit_button.click
    end

    def get_invalid_hex_prompt_text
        return 'Invalid hexadecimal data.  Try again.'
    end

    def go_back
        back_button.click
    end

end