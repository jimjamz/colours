require 'yaml'

class Palette
    attr_accessor :colours

    def initialize palette_file = false
        @palette_file = palette_file
        @colours = @palette_file ? YAML::load(File.read(@palette_file)) : []
    end

    def get_colours_in_category category
        @colours.select do |colour|
            colour.category == category
        end
    end

    def add_colour colour
        @colours.push colour
    end

    def get_colour name
        @colours.select do |colour|
            colour.name == name
        end.first
    end

    def save palette_file = false
        @palette_file = palette_file || @palette_file || "palette.yml"
        File.open @palette_file, "w" do |f|
            f.write YAML::dump @colours
        end
    end
end
