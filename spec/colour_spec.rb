require 'spec_helper'

describe Colour do

    before :each do
         @colour = Colour.new "Name", "Value", :category
     end

    describe "#new" do
        it "takes three parameters and returns a colour object" do
            @colour.should be_an_instance_of colour
        end
    end
    describe "#name" do
        it "returns the correct name" do
            @colour.name.should eql "Name"
        end
    end
    describe "#value" do
        it "returns the correct value" do
            @colour.value.should eql "Value"
        end
    end
    describe "#category" do
        it "returns the correct category" do
            @colour.category.should eql :category
        end
    end
end
