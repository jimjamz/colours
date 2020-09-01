class HomePage < SitePrism::Page
    set_url '/index.html'
    elements :colour_cells, "div[class='colour-cell']"
    elements :text_cells, "div[class='text-cell']"
    element :red_colour_cell, "div[id='colour-cell-red']"
    element :green_colour_cell, "div[id='colour-cell-green']"
    element :blue_colour_cell, "div[id='colour-cell-blue']"
    element :red_text_cell, "a[href='red']"
    element :green_text_cell, "a[href='green']"
    element :blue_text_cell, "a[href='blue']"
    # section :colours_main, ColoursMainSection, "div[id='colours-main']"
    # section :colours_grid, ColoursGridSection, "div[id='colours-grid']"

    def click_colour_cell(colour)
        send("has_#{colour}_colour_cell?")
        send("#{colour}_colour_cell").click
        
        # pp colour_cells
        # cell = @color_cells.find_by(id: "colour-cell-#{@color}") # just an example, I don't know how to do element queries in site-prism
        # selected_colour = page.find(:css, 'div#colours-grid div#selected-colour-' + colour)
        
        # cell = colour_cells.select {|c| c.is_a?(id: 'colour-cell-' + colour) }
        # cell = colour_cells.find(id: 'colour-cell-' + colour)
        # cell = page.find_by_id('colour-cell-' + colour)
        # cell.click
    end
end