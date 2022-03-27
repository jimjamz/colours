Feature: Colours
  As a user,
  I want to choose a colour,
  in order to receive the chosen colour.

  Scenario Outline: Get the colour
    Given I have a colours app with "<colour>"
    When I ask it to say the colour
    Then it should return the colour "<colour>"
    Examples:
      | colour |
      | red    |
      | green  |
      | blue   |
      