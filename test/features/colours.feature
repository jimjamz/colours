Feature: Colours
  As a user,
  I want to navigate to a page,
  in order to see the relevant colour.

  Background:
    Given I am on the home page

  Scenario Outline: Navigate to a page of colour
    When I select the colour "<colour>"
    Then I am navigated to the "<colour>" page
    And I should see the colour "<colour>"
    And I should see the text "The chosen colour is <colour>"
    Examples:
      | colour |
      | red    |
      | green  |
      | blue   |

  Scenario Outline: Successfully create a custom colour to navigate to
    Given the custom colour text box is available
    When I enter the colour "<colour>"
    Then I am navigated to the custom colour page
    And I should see the colour "<colour>"
    And I should see the text "The chosen colour is <colour>"
    Examples:
      | colour |
      | 000    |
      | 6600ff |
      | f50    |
      | abc    |
      | 123    |

  Scenario Outline: Prevent invalid or empty custom colours
    Given the custom colour text box is available
    When I enter the colour "<colour>"
    Then the custom colour text box is not available
    And I am informed that the colour is not valid
    And I am on the home page
    Examples:
      | colour   |
      | jimjamz  |
      | jjff00   |
      |          |
      | 000g00   |
      | !"$%&*"# |
