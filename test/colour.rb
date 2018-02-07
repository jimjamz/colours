# define the class, Colour
class Colour
  # add the attributes to the class
  attr_accessor :name, :value, :category
  def initialize(name, value, category)
    @name = name
    @value = value
    @category = category
  end
end