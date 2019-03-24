class Player
  attr_reader :name, :cards, :cash

  def initialize (name)
    @name = name
    @cash = 100
    @cards = []
  end

  def total 
    total = 0
    @cards.each do |card| 
      if card.ace? && total > 10
        total += 1
      else
        total += card.point
      end
    end
    total
  end

  def take_card(card)
    @cards << card if can_take_card?
  end

  def give_money(money)
    @cash -= money
  end

  def take_money(money)
    @cash += money
  end

  def can_take_card?
    if @cards.size < 3
      return true
    else
      return false
    end
  end

  def fold
    @cards = []
  end

  def show_cards
    @cards.each do |card|
      print card.suit
      print " "
      puts card.value
    end
  end
end
