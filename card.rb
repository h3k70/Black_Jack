class Card

  attr_reader :suit, :value, :point

  def initialize (suit, value, point)
    @suit  = suit
    @value = value
    @point = point
  end

  def ace?
    @value == "A"
  end

end
