require_relative 'card.rb'

class Deck
  def initialize
    @deck = create_deck
  end

  def give_card
    @deck.pop
  end

  private

  def create_deck
    cards = []
    Card::SUITS.each do |suit|
      Card::VALUES.each do |value, point|
        cards << Card.new(suit, value, point)
      end
    end
    cards.shuffle!
  end
end
