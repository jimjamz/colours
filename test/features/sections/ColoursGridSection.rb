class ColoursGridSection < SitePrism::Section
    elements :colour_cells, "div[class='colour-cell']"
    elements :text_cells, "div[class='text-cell']"
    element :red_colour_cell, "div[id='colour-cell-red']"
    element :green_colour_cell, "div[id='colour-cell-green']"
    element :blue_colour_cell, "div[id='colour-cell-blue']"
    element :colour_cell_styling, :css, "div[class='colour-cell']"
    element :red_text_cell, "a[href='red']"
    element :green_text_cell, "a[href='green']"
    element :blue_text_cell, "a[href='blue']"
    element :selected_colour_red, "div[id='selected-colour-red']"
    element :selected_colour_green, "div[id='selected-colour-green']"
    element :selected_colour_blue, "div[id='selected-colour-blue']"
    element :selected_colour_custom, "div[id='selected-colour-custom']"
    element :back_button, "div[id='go-back']"

    def validate_colour_cell(colour)
        send("has_selected_colour_#{colour}?")
    end

    def click_colour_cell(colour)
        send("has_#{colour}_colour_cell?")
        send("#{colour}_colour_cell").click
    end

    def go_back
        back_button.click
    end
end