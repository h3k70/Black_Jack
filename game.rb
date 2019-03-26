require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'interface.rb'
require_relative 'gamerules.rb'
require_relative 'accountant.rb'

class Game
  attr_accessor :deck, :player, :dealer

  BJ = GameRules::BLACKJACK

  def initialize
    @accountant = Accountant.new
    @interface = Interface.new
    start_game
  end

  private

  def new_player
    name = @interface.ask_name
    @player = Player.new(name)
  end

  def start_game
    @dealer = Dealer.new
    new_player
    loop do
      break if money_zero?

      @interface.start
      give_cards
      bet
      move_player
      open_cards
    end
    end_game
  end

  def give_cards
    @deck = Deck.new
    2.times do
      @player.hand.take_card(@deck.give_card)
      @dealer.hand.take_card(@deck.give_card)
    end
  end

  def bet
    @accountant.bet(@player)
    @accountant.bet(@dealer)
  end

  def money_zero?
    @player.cash <= 0 || @dealer.cash <= 0
  end

  def move_player
    loop do
      @interface.show_info(@player, @dealer)
      @interface.show_choice
      user_choice = gets.to_i
      case user_choice
      when 1 then return
      when 2 then
        move_dealer
      when 3 then
        @player.hand.take_card(@deck.give_card)
        move_dealer
      end
    end
  end

  def move_dealer
    @dealer.hand.take_card(@deck.give_card) if @dealer.hand.can_take_card?
  end

  def open_cards
    @interface.show_full_info(@player, @dealer)
    winner = who_win_raund(@player, @dealer)
    if winner
      reward_winner(winner)
    else
      draw
    end
    reset
  end

  def who_win_raund(player, dealer)
    if (player.hand.total == dealer.hand.total) || (BJ < player.hand.total && BJ < dealer.hand.total)
      nil
    elsif BJ < player.hand.total
      @dealer
    elsif BJ < dealer.hand.total
      @player
    elsif player.hand.total > dealer.hand.total
      @player
    elsif dealer.hand.total > player.hand.total
      @dealer
    end
  end

  def reset
    @player.hand.fold
    @dealer.hand.fold
  end

  def reward_winner(player)
    @interface.reward_winner(player)
    @accountant.reward_winner(player)
  end

  def draw
    @interface.draw
    @accountant.refund(@player, @dealer)
  end

  def who_win_game
    if @player.cash > 0
      @player
    else
      @dealer
    end
  end

  def end_game
    winner = who_win_game
    user_choice = @interface.end_game(winner)
    case user_choice
    when 1 then start_game
    when 2 then exit
    end
  end
end

game = Game.new
