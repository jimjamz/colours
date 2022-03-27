package io.cucumber.colours;

import io.cucumber.java.en.Given;
import io.cucumber.java.en.When;
import io.cucumber.java.en.Then;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class StepDefinitions {
    private Colours colours;
    private String saidColour;

    @Given("^I have a colours app with \"([^\"]*)\"$")
    public void I_have_a_colours_app_with(String colour) {
        colours = new Colours(colour);
    }

    @When("^I ask it to say the colour$")
    public void I_ask_it_to_say_the_colour() {
        saidColour = colours.sayColour();
    }

    @Then("^it should return the colour \"([^\"]*)\"$")
    public void it_should_return_the_colour(String expectedColour) {
        assertEquals(expectedColour, saidColour);
    }
}
