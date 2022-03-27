package io.cucumber.colours;

public class Colours {
    private final String colour;

    public Colours(String colour) {
        this.colour = colour;
    }

    public String sayColour() {
        return colour;
    }
}
