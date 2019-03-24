class Interface

  INPUT_NAME = "Введите имя"
  ANONIM = "ANONIM"
  LINE = "-------------------------"
  DLINE = "========================="
  MONEY = "Деньги"
  TOTAL = "Счет"
  CARD = "Карты"
  DROP_CARD = "Раздаются карты"
  ACTIONS = [ 
    'Открыть карты.',
    'Пропустить ход ',
    'Добавить карту '
    ]
  DRAW = "Ничья"
  WIN = "Вы выйграли"
  LOSE = "Bы проиграли"
  PLAY_AGAIN = "Играть снова?(1-yes,2-no)"
  END_GAME = "Победил:"


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
    #puts TOTAL + " #{player.name}:#{player.total}"
    puts MONEY + " #{player.name}:#{player.cash}"
    #puts TOTAL + " #{dealer.name}:??"
    puts MONEY + " #{dealer.name}:#{dealer.cash}"
    puts DLINE
    puts CARD + " #{player.name}" 
    player.show_cards
    puts DLINE
    puts CARD + " #{dealer.name}"
    puts "**"
    puts '**'
  end

  def show_choice
    ACTIONS.each.with_index(1) do |action, index|
      puts "#{index}. #{action}"
    end
  end

  def show_full_info(player, dealer)
    #puts LINE
    #puts TOTAL + " #{player.name}:#{player.total}"
    #puts MONEY + " #{player.name}:#{player.cash}"
    #puts TOTAL + " #{dealer.name}:#{dealer.total}"
    #puts MONEY + " #{dealer.name}:#{dealer.cash}"
    #puts DLINE
    #puts CARD + " #{player.name}" 
    #player.show_cards
    puts DLINE
    puts CARD + " #{dealer.name}"
    dealer.show_cards
  end

  def draw
    puts DRAW
  end

  def player_win
    puts WIN
  end

  def player_lose
    puts LOSE
  end

  def end_game(winner)
    print END_GAME
    puts " #{winner.name}"
    puts PLAY_AGAIN
    gets.to_i
  end
end

