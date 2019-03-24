require_relative 'player.rb'
require_relative 'dealer.rb'
require_relative 'deck.rb'
require_relative 'card.rb'
require_relative 'interface.rb'

class Game
 
  attr_accessor :deck, :player, :dealer

  BET = 10

  def initialize
    @interface = Interface.new
    start_game
  end

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
      @interface.show_info(@player, @dealer)
      move_player
      open_cards
    end
    end_game
  end

  def give_cards
    @deck = Deck.new
    2.times do
      @player.take_card(@deck.give_card)
      @dealer.take_card(@deck.give_card)
    end
  end

  def bet
    @player.give_money(BET)
    @dealer.give_money(BET)
  end

  def money_zero?
    @player.cash <= 0 || @dealer.cash <= 0
  end

  def move_player
    @interface.show_choice
    user_choice = gets.to_i

    case user_choice
    when 1 then return 
    when 2 then 
      move_dealer
    when 3 then 
      @player.take_card(@deck.give_card)
      move_dealer
    end
  end

  def move_dealer
    @dealer.take_card(@deck.give_card) if @dealer.can_take_card?
  end

  def open_cards
    @interface.show_full_info(@player, @dealer)
    if player.total == dealer.total
      draw
    elsif 21 < player.total
      player_lose
    elsif 21 < dealer.total
      player_win
    elsif player.total > dealer.total
      player_win
    elsif dealer.total > player.total
      player_lose
    end 
    @player.fold
    @dealer.fold
  end

  def player_win
    @interface.player_win
    @player.take_money(BET*2)
  end

  def player_lose
    @interface.player_lose
    @dealer.take_money(BET*2)
  end

  def draw
    @interface.draw
    @player.take_money(BET)
    @dealer.take_money(BET)
  end

  def who_win
    if @player.cash > 0
      @player
    else
      @dealer
    end
  end

  def end_game
    winner = who_win
    user_choice = @interface.end_game(winner)
    case user_choice
    when 1 then start_game
    when 2 then exit
    end
  end
end

game = Game.new

