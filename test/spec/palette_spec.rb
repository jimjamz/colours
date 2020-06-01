# import the settings from spec_helper.rb
require 'spec_helper'

# define the Palette Object
describe 'Palette object' do
  before :all do
    # create the Palette Object
    palette_obj = [
      # add instances of Colour to the Palette Object
      Colour.new('red', 'FF0000', :primary),
      Colour.new('green', '00FF00', :primary),
      Colour.new('blue', '0000FF', :primary),
      Colour.new('yellow', 'FFFF00', :secondary),
      Colour.new('purple', 'CC00FF', :secondary)
    ]
    # create a colours.yml file and make it writeable
    File.open 'colours.yml', 'w' do |f|
      # save the Palette Object to colours.yml
      f.write YAML::dump palette_obj
    end
  end

  before :each do
    # Create an instance of the Palette class
    # using the data from colours.yml
    @palette = Palette.new 'colours.yml'
  end

  describe '#new' do
    context 'with no parameters' do
      it 'has no colours' do
        palette = Palette.new
        # palette.should have(0).colours
        expect(palette).to have(0).colours
      end
    end

    context 'with a yaml file parameter' do
      it 'has 5 colours' do
        # @palette.should have(5).colours
        expect(@palette).to have(5).colours
      end
    end
  end

  it 'returns all the colours in the primary category' do
    # @palette.get_colours_in_category(:primary).length.should == 3
    expect(@palette.get_colours_in_category(:primary)).to have(3).colours
  end

  it 'returns all the colours in the secondary category' do
    # @palette.get_colours_in_category(:secondary).length.should == 2
    expect(@palette.get_colours_in_category(:secondary)).to have(2).colours
  end

  it 'accepts new colours' do
    @palette.add_colour(Colour.new('brown', 'CC7700', :secondary))
    expect(@palette.get_colour('brown')).to be_an_instance_of Colour
    expect(@palette.get_colours_in_category(:secondary)).to have(3).colours
  end

  it 'does not accept two of the same colour' do
    # green is already a colour in the palette
    expect(@palette.get_colour('green')).to be_an_instance_of Colour
    # and there are 3 primary colours
    expect(@palette.get_colours_in_category(:primary)).to have(3).colours
    # when trying to add green again to the palette
    @palette.add_colour(Colour.new('green', '00FF00', :primary))
    # ensure there can still be only 3 primary colours
    expect(@palette.get_colours_in_category(:primary)).to have(3).colours
  end

  it 'saves the palette' do
    # save each colour in the palette to a file
    colours = @palette.colours.map { |colour| colour.name }
    @palette.save('results/test_palette.yml')
    # create a new palette based on the contents of the previously saved file
    palette2 = Palette.new 'results/test_palette.yml'
    colours2 = palette2.colours.map { |colour| colour.name }
    # verify that the array of colours saved to the file match those that are fetched from it
    expect(colours).to eql colours2
  end
end