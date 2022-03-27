package cucumber.examples.java.colours;

import cucumber.annotation.en.Given;
import cucumber.annotation.en.When;
import cucumber.annotation.en.Then;

import static org.junit.Assert.assertEquals;

public class StepDefinitions {
    private Colours colours;
    private String red;
    private String green;
    private String blue;

    @Given("^I have a colours app with \"([^\"]*)\"$")
    public void I_have_a_colours_app_with(String choice) {
        colours = new Colours(choice);
    }

    @When("^I ask it to say the colour$")
    public void I_ask_it_to_say_the_colour() {
        red = colours.sayColour();
    }

    @Then("^it should return the colour \"([^\"]*)\"$")
    public void it_should_return_the_colour(String expectedColour) {
        assertEquals(expectedColour, red);
    }
}