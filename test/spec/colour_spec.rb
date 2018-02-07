require 'spec_helper'

# tests cases for the Colour class
describe Colour do
  # before each test ...
  before :each do
    # create an instance (@colour) of the class, Colour
    @colour = Colour.new 'Name', 'Value', :category
  end
  # create a test for when we use @colour.new
  describe '#new' do
    it 'takes three parameters and returns a colour object' do
      # 'should' method has been deprecated:
      # @colour.should be_an_instance_of colour
      # instead, use 'expect':
      expect(@colour).to be_an_instance_of Colour
    end
  end
  # create a test for when we use @colour.name
  describe '#name' do
    # the test will ensure that ...
    it 'returns the correct name' do
      # @colour.name.should eql 'Name'
      expect(@colour.name).to eql 'Name'
    end
  end
  describe '#value' do
    it 'returns the correct value' do
      # @colour.value.should eql 'Value'
      expect(@colour.value).to eql 'Value'
    end
  end
  describe '#category' do
    it 'returns the correct category' do
      # @colour.category.should eql :category
      expect(@colour.category).to eql :category
    end
  end
end
