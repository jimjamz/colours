When(/^I select the colour "(.*?)"$/) do |colour|
  click_link(colour)
end

Then(/^I am navigated to the "(.*?)" colour page$/) do |colour|
  expect(page).to have_selector('title', text: colour, visible: false)
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
  #old:
  # expect(find('#colour-row')).to have_xpath("//td[@bgcolor = '#{hex_colour}']")
  # robust:
  # expect(find('div#colours-grid')).to have_css('#selected-colour-' + colour)
  # brittle / specific:
  # gets the div that corresponds to the CSS class:
  selected_colour = page.find(:css, 'div#colours-grid div#selected-colour-' + colour)
  # Capybara reads the interpolated colour from the CSS value, 
  # which is being rendered in HTML as an RGB value,
  expect(selected_colour).to match_style('background-color' => rgb_colour)
end

And(/^I should see the text "(.*?)"$/) do |page_text|
  expect(page).to have_content(page_text)
end

Given(/^the custom colour text box is available$/) do
  expect(page).to have_selector('input#colourpicker')
end

When(/^I enter the colour "(.*?)"/) do |hex_colour|
  within('div#colours-selector') do
    fill_in 'colourpicker', with: hex_colour
  end
end

When('the custom colour is validated') do
  find('div#colours-selector form input#colourpicker').native.send_keys(:tab)
end

Then('the valid custom colour can be submitted') do
  within('div#colours-selector') do
    click_button("submit")
  end
end

Then('I should be informed that the colour is not valid') do
  message = accept_alert do
    find('div#colours-selector form input#colourpicker').native.send_keys(:tab)
  end
  expect(message).to eq('Invalid hexadecimal data.  Try again.')
end

Then('the invalid custom colour cannot be submitted') do
  within('div#colours-selector') do
    expect(page).to have_selector('input#submit', visible: false)
  end
end

And(/^I should see the custom colour text "(.*?)"$/) do |custom_text|
  within('div#colours-selector') do
    expect(page).to have_field('colourpicker', with: custom_text)
  end
end

And(/^I should not see the custom colour text "(.*?)"$/) do |custom_text|
  within('div#colours-selector') do
    expect(page).to_not have_field('colourpicker', with: custom_text)
  end
end