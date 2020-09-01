Given(/^I am on the home page$/) do
  @home_page.load
  # expect(@home_page).to be_displayed
end

And(/^I should be on the "(.*?)" page$/) do | visited_page |
  if visited_page == "home"
    visited_page = 'index'
  end
  expect(@home_page).to have_current_path(/#{visited_page}/)
  # expect(@home_page).to be_displayed
end