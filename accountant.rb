require_relative 'gamerules.rb'

class Accountant
  def initialize
    @amount = 0
  end

  def bet(player)
    player.withdraw_money(GameRules::BET)
    @amount += GameRules::BET
  end

  def reward_winner(player)
    player.add_money(@amount)
    @amount = 0
  end

  def refund(player, dealer)
    player.add_money(@amount / 2)
    dealer.add_money(@amount / 2)
    @amount = 0
  end
end
