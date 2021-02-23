require 'yaml'

class Palette
  attr_accessor :colours

  def initialize palette_file = false
    @palette_file = palette_file
    @colours = @palette_file ? YAML::load(File.read(@palette_file)) : []
  end

  def get_colours_in_category(category)
    @colours.select do |colour|
      colour.category == category
    end
  end

  def add_colour colour
    # as long as the name of the colour to add is not already in the array
    unless @colours.any? {|item| item.name == colour.name }
      # add the colour to the array of colours
      @colours.push colour
    else
      print "\n#{colour.name} already exists in the palette."
    end
  end

  def delete_colour colour
    # if the specified colour exists in the array
    if @colours.include?(colour)
      # delete the colour from the array
      @colours.delete colour
    else
      print "\n#{colour.name} is not in the palette."
    end
  end

  def get_colour name
    @colours.select do |colour|
      colour.name == name
    end.first
  end

  def save palette_file = false
    @palette_file = palette_file || @palette_file || 'palette.yml'
    File.open @palette_file, 'w' do |f|
      f.write YAML::dump @colours
    end
  end
end
