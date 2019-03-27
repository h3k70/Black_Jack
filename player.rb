require_relative 'game_rules.rb'
require_relative 'hand.rb'

class Player
  attr_reader :name, :cash
  attr_accessor :hand

  def initialize(name)
    @name = name
    @cash = GameRules::START_MONEY
    @hand = Hand.new
  end

  def withdraw_money(money)
    @cash -= money
  end

  def add_money(money)
    @cash += money
  end
end
