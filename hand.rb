require_relative 'game_rules.rb'

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total
    total ||= 0
    total = @cards.sum(&:point)
    @cards.each do |card|
      if total > GameRules::BLACKJACK && card.ace?
        total -= 10
      end
    end
    total
  end

  def take_card(card)
    @cards << card if can_take_card?
  end

  def can_take_card?
    @cards.size < GameRules::MAX_CARDS
  end

  def fold
    @cards = []
  end
end
