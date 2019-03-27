class Dealer < Player
  NAME = 'Dealer'.freeze

  def initialize
    super(NAME)
  end

  def can_take_card?
    @hand.cards.size < GameRules::MAX_CARDS && @hand.total < GameRules::DEALER_MAX_POINTS
  end
end
