Feature: Colours
  As a user,
  I want to navigate to a page,
  in order to see the relevant colour.

  Background:
    Given I am on the home page

  Scenario Outline: Navigate to a page of colour
    When I select the colour "<colour>"
    Then I am navigated to the "<colour>" colour page
    And I should see the colour "<colour>"
    And I should see the text "The selected colour is <colour>"
    Examples:
      | colour |
      | red    |
      | green  |
      | blue   |

  Scenario Outline: Create a valid custom colour (Imperative)
    Given the custom colour text box is available
    When I enter the colour "<colour>"
    And the custom colour is validated
    Then the valid custom colour can be submitted
    And I am navigated to the "custom" colour page
    And I should see the colour "<colour>"
    And I should see the text "The selected colour is #<colour>"
    Examples:
      | colour |
      | 000000 |
      | 000    |
      | 6600ff |
      | f50    |
      | ffffff |
      | abc    |
      | 123    |

  Scenario Outline: Create a valid custom colour (Declarative)
    Given custom colours can be created
    When I create the custom colour "<colour>"
    Then I am navigated to the "custom" colour page
    And I should see the colour "<colour>"
    And I should see the text "The selected colour is #<colour>"
    Examples:
      | colour |
      | 000000 |
      | 000    |
      | 6600ff |
      | f50    |
      | ffffff |
      | abc    |
      | 123    |


  Scenario Outline: Prevent invalid or empty custom colours
    Given custom colours can be created
    When I try to create the custom colour "<invalid_colour>"
    Then I should be informed that the colour is not valid
    And the invalid custom colour cannot be submitted
    And I should be returned to the "home" page
    Examples:
      | invalid_colour |
      | jimjam         |
      | jjff00         |
      | jjj            |
      | 0f             |
      |                |
      | 000g00         |
      | !"$%&*"#       |

  # The following scenario is not a real BDD scenario
  # It is technical detail, explaining the 'how', not the 'what'
  # It wouldn't normally feature within a Feature (pun intended)
  Scenario Outline: Hexadecimal character limit is applied to custom colours
    Given custom colours can be created
    When I try to create the custom colour "<overlong_colour>"
    Then I should see the custom colour text "<truncated>"
    # The following step is not required. It is imperative.
    # It should be pushed down into the previous step.
    And I should not see the custom colour text "<overlong_colour>"
    Examples:
      | overlong_colour | truncated |
      | abcdefg         | abcdef    |
      | 1234567         | 123456    |