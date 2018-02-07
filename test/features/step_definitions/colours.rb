When(/^I select the colour "(.*?)"$/) do |colour|
  click_link(colour)
end

Then(/^I am taken to the "(.*?)" page$/) do |colour|
  expect(page).to have_selector('title', text: colour, visible: false)
end

And(/^I can see the colour "(.*?)"$/) do |colour|
  case colour
    when 'red'
      hex_colour = '#FF0000'
    when 'green'
      hex_colour = '#00FF00'
    when 'blue'
      hex_colour = '#0000FF'
  end
  expect(find('#colour-row')).to have_xpath("//td[@bgcolor = '#{hex_colour}']")
end

And(/^I should see the text "(.*?)"$/) do |page_text|
  expect(page).to have_content(page_text)
end