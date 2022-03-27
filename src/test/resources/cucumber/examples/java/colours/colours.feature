Feature: Colours
  As a user,
  I want to choose a colour,
  in order to receive the chosen colour.

  Background:
    Given I have a colours app with "colours"

  Scenario: Get the colour red
    When I ask it to say red
    Then it should return the colour "Red"