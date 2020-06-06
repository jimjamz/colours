Given(/^I am on the home page$/) do
  visit '/index.html'
end

And(/^I should be on the "(.*?)" page$/) do | visited_page |
  if visited_page == "home"
    visited_page = 'index'
  end
  expect(page).to  have_current_path(/#{visited_page}/)
end