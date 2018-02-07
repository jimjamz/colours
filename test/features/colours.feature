Feature: Colours
  As a user,
  I want to navigate to a page,
  in order to see the relevant colour.

  Background:
    Given I am on the home page

  Scenario Outline: Navigate to a page of colour
    When I select the colour "<colour>"
    Then I am taken to the "<colour>" page
    And I can see the colour "<colour>"
    And I should see the text "The chosen colour is <colour>"
    Examples:
      | colour |
      | red    |
      | green  |
      | blue   |