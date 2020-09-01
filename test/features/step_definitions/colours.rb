When(/^I select the colour "(.*?)"$/) do |colour|
  @home_page.click_colour_cell(colour)
end

Then(/^I am navigated to the "(.*?)" colour page$/) do |colour|
  expect(@colour_page.current_url).to include(colour)
  expect(@colour_page.title).to include(colour)
  # @colour_page.validate_page(colour)
end

And(/^I should see the colour "(.*?)"$/) do |colour|
  def hex2rgb(in_hex)
    # if the input is 3-digit hexadecimal notation
    if in_hex.length < 6
      # expand to a 6-digit hexadecimal
      s = []
      in_hex.split("").each do |x|
        s.push(x.chr, x.chr)
      end
      in_hex = s.join("")
    end
    # convert each of the 3 hexadecimal pairs into a denary integer
    t = in_hex.scan(/../).map {|color| color.to_i(16)}
    out_rgb = /rgba?\(#{t[0]}, #{t[1]}, #{t[2]}(, 1)?\)/
    return out_rgb
  end

  case colour
    when 'red'
      rgb_colour = /rgba?\(255, 0, 0(, 1)?\)/
    when 'green'
      rgb_colour = /rgba?\(0, 255, 0(, 1)?\)/
    when 'blue'
      rgb_colour = /rgba?\(0, 0, 255(, 1)?\)/
    else
      rgb_colour = hex2rgb(colour)
      colour = 'custom'
  end
  @colour_page.validate_colour_cell(colour)
  expect(@colour_page.colour_style).to match_style('background-color' => rgb_colour)
end

And(/^I should see the text "(.*?)"$/) do |page_text|
  expect(@colour_page.colour_text).to have_content(page_text)
end

Given(/^the custom colour text box is available$/) do
  expect(@colour_page).to have_colourpicker_text_box
end

When(/^I enter the colour "(.*?)"/) do |hex_colour|
  @colour_page.enter_custom_colour_text(hex_colour)
end

When('the custom colour is validated') do
  @colour_page.colourpicker_text_box.send_keys(:tab)
end

Then('the valid custom colour can be submitted') do
  @colour_page.submit_custom_colour
end

Then('I should be informed that the colour is not valid') do
  message = accept_alert do
    @colour_page.colourpicker_text_box.send_keys(:tab)
  end
  expect(message).to eq(@colour_page.get_invalid_hex_prompt_text)
end

Then('the invalid custom colour cannot be submitted') do
  expect(@colour_page).to_not have_colourpicker_submit_button
end

And(/^I should see the custom colour text "(.*?)"$/) do |custom_text| 
  # expect(@colour_page.colourpicker_text_box.text).to include(custom_text)
  pp @colour_page.get_custom_colourpicker_value
  expect(@colour_page.get_custom_colourpicker_value).to eq(custom_text)
end

And(/^I should not see the custom colour text "(.*?)"$/) do |custom_text|
  expect(@colour_page.get_custom_colourpicker_value).to_not eq(custom_text)
end