class Interface
  INPUT_NAME = 'Введите имя'.freeze
  ANONIM = 'ANONIM'.freeze
  LINE = '-------------------------'.freeze
  DLINE = '========================='.freeze
  MONEY = 'Деньги'.freeze
  TOTAL = 'Счет'.freeze
  CARD = 'Карты'.freeze
  DROP_CARD = 'Раздаются карты'.freeze
  ACTIONS = [
    'Открыть карты.',
    'Пропустить ход ',
    'Добавить карту '
  ].freeze
  DRAW = 'Ничья'.freeze
  WIN_ROUND = 'Bыиграл:'.freeze
  # LOSE = "Bы проиграли"
  PLAY_AGAIN = 'Играть снова?(1-да, 2-нет)'.freeze
  BET_AGAIN = 'Сделать ставку снова?(1-да, 2-нет)'
  END_GAME = 'Победил:'.freeze

  def start
    puts DROP_CARD
    puts LINE
  end

  def ask_name
    puts INPUT_NAME
    name = gets.chomp
    name = ANONIM if name.to_s.empty?
    name
  end

  def show_info(player, dealer)
    puts LINE
    # puts TOTAL + " #{player.name}:#{player.total}"
    puts MONEY + " #{player.name}:#{player.cash}"
    # puts TOTAL + " #{dealer.name}:??"
    puts MONEY + " #{dealer.name}:#{dealer.cash}"
    puts DLINE
    puts CARD + " #{player.name}"
    show_cards(player)
    puts DLINE
    puts CARD + " #{dealer.name}"
    dealer_closed_cards(dealer)
  end

  def show_choice
    ACTIONS.each.with_index(1) do |action, index|
      puts "#{index}. #{action}"
    end
  end

  def show_full_info(player, dealer)
    # puts LINE
    # puts TOTAL + " #{player.name}:#{player.total}"
    # puts MONEY + " #{player.name}:#{player.cash}"
    # puts TOTAL + " #{dealer.name}:#{dealer.total}"
    # puts MONEY + " #{dealer.name}:#{dealer.cash}"
    # puts DLINE
    puts CARD + " #{player.name}"
    show_cards(player)
    puts DLINE
    puts CARD + " #{dealer.name}"
    show_cards(dealer)
  end

  def draw
    puts DRAW
  end

  def reward_winner(player)
    print WIN_ROUND
    puts " #{player.name}"
  end

  def end_game(winner)
    puts LINE
    puts LINE
    print END_GAME
    puts " #{winner.name}"
    puts PLAY_AGAIN
    gets.to_i
  end

  def show_money(player, dealer)
    puts MONEY + " #{player.name}:#{player.cash}"
    puts MONEY + " #{dealer.name}:#{dealer.cash}"
  end

  def end_round
    puts BET_AGAIN
    gets.to_i
  end

  private

  def show_cards(player)
    player.hand.cards.each do |card|
      print card.suit
      print ' '
      puts card.value
    end
  end

  def dealer_closed_cards(dealer)
    dealer.hand.cards.each do
      puts '**'
    end
  end
end
