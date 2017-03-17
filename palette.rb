require 'spec_helper'

describe "Palette object" do

    before :all do
        lib_obj = [
            Colour.new("red", "FF0000", :primary),
            Colour.new("green", "00FF00", :primary),
            Colour.new("blue", "0000FF", :primary),
            Colour.new("yellow", "FFFF00", :secondary)
        ]
        File.open "colours.yml", "w" do |f|
            f.write YAML::dump lib_obj
        end
    end

    before :each do
        @lib = Palette.new "colours.yml"
    end
end
