require_relative 'gamerules.rb'

class Hand
  attr_accessor :cards

  def initialize
    @cards = []
  end

  def total
    total = 0
    @cards.each do |card|
      total += if card.ace? && total > 10
                 1
               else
                 card.point
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
