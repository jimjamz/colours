Given(/^I am on the home page$/) do
  @home_page.load
  # expect(@home_page).to be_displayed
end

And(/^I should be (?:on|returned to) the "(.*?)" page$/) do | visited_page |
  if visited_page == "home"
    visited_page = 'index'
    the_page = @home_page
  end
  expect(the_page).to have_current_path(/#{visited_page}/)
end