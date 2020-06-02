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
    And I should see the text "The chosen colour is <colour>"
    Examples:
      | colour |
      | red    |
      | green  |
      | blue   |

  Scenario Outline: Successfully create a valid custom colour to navigate to
    Given the custom colour text box is available
    When I enter the colour "<colour>"
    And the custom colour is validated
    Then the valid custom colour can be submitted
    And I am navigated to the "custom" colour page
    And I should see the colour "<colour>"
    And I should see the text "The chosen colour is <colour>"
    Examples:
      | colour |
      | 000    |
      | 6600ff |
      | f50    |
      | ffffff |
      | abc    |
      | 123    |

  Scenario Outline: Prevent invalid or empty custom colours
    Given the custom colour text box is available
    When I enter the colour "<invalid_colour>"
    And the custom colour is validated
    Then the invalid custom colour cannot be submitted
    And I should be informed that the colour is not valid
    And I should be on the "home" page
    Examples:
      | invalid_colour |
      | jimjam         |
      | jjff00         |
      |                |
      | 000g00         |
      | !"$%&*"#       |

  Scenario Outline: Maximum hexadecimal character limit validation is applied to custom colours
    Given the custom colour text box is available
    When I enter the colour "<colour>"
    And the custom colour is validated
    Then I should see the text "<truncated>"
    And I should not see the text "<colour>"
    Examples:
      | colour  | truncated |
      | jimjamz | jimjam    |
      | 1234567 | 123456    |

