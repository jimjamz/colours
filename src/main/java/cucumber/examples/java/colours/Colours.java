package cucumber.examples.java.colours;

public class Colours {
    private final String choice;

    public Colours(String choice) {
        this.choice = choice;
    }

    public String sayColour() {
        return choice;
    }
}
