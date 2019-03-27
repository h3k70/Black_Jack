class Dealer < Player
  NAME = 'Dealer'.freeze

  def initialize
    super(NAME)
  end

  def take_card?
    @hand.can_take_card? && @hand.total < GameRules::DEALER_MAX_POINTS
  end
end
