require_relative 'card.rb'

class Deck

  SUITS = %w[♠ ♥ ♣ ♦]
  VALUES = {
    "2"  => 2,
    "3"  => 3,
    "4"  => 4,
    "5"  => 5,
    "6"  => 6,
    "7"  => 7,
    "8"  => 8,
    "9"  => 9,
    "10" => 10,
    "J"  => 10,
    "Q"  => 10,
    "K"  => 10,
    "A"  => 11
  }

  def initialize
    @deck = create_deck
  end

  def give_card
    @deck.pop
  end

  private

  def create_deck
    cards = []
    SUITS.each do |suit|
      VALUES.each do |value, point|
        cards << Card.new(suit, value, point)
      end
    end
    cards.shuffle!
  end
end
