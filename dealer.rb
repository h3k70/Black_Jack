class Dealer < Player
  NAME = "Dealer"

  def initialize
    super(NAME)
  end

  def can_take_card?
    super && total < 17
  end
end
