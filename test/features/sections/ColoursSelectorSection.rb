class ColoursSelectorSection < SitePrism::Section
    element :colourpicker_text_box, "input[id='colourpicker']"
    element :colourpicker_submit_button, "input[id='submit']"
    
  def enter_custom_colour_text(hex_colour)
      colourpicker_text_box.set hex_colour
  end

  def get_custom_colourpicker_value
      return colourpicker_text_box.value
  end

  def submit_custom_colour
      colourpicker_submit_button.click
  end
end