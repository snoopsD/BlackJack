#class Main
require_relative 'Player'
require_relative 'Deck'
require_relative 'HumanPlayer'
require_relative 'ComputerPlayer'

class Main
  attr_accessor :player, :dealer

    def initialize
      @player = player
      @dealer = dealer
      @deck = Deck.new
      @dealer = ComputerPlayer.new
    end

  def welcome
    puts "Введите ваше имя: "
    @name = gets.capitalize.chomp
    @player = HumanPlayer.new(@name)
    puts "Добро пожаловать в игру Black Jack, #{@name}"
    puts "Сейчас на Вашем счету #{player.bank_player} монет"
  end

  def begin_play
    50.times{print "-"}
    puts
    puts "Перемешиваем колоду и раздаем каждому по 2 карты: "
    screenplay
    distribution_of_cards
    puts "У вас на руках: "
    turn_player
    puts "Итого очков: #{@player.amount_cards}"
    bet
    puts "Ставка в банк 10 монет. На вашем счету: #{@player.bank}"
    turn_dealer
    puts "У дилера на руках ***"
  end

  def actions
    puts "1. Пропустить ход"
    puts "2. Добавить карту"
    puts "3. Открыть карты"
  end

  def exec_actions(choose)
    case choose
    when 1
      dealer_choose
    when 2
      player_choose
    end
  end

  def open_cards
  end

  def dealer_choose
   puts "Ход перешел к дилеру."
   screenplay
   @dealer.hold_cards << @deck.give_cards(1) if (@dealer.amount_cards <= 10)
   @dealer.check_ace
  end

  def player_choose
    @player.hold_cards << @deck.give_cards(1)
    @player.check_ace
    @player.amount_cards
    @player.show_cards
    puts "Итого очков по итогу 3х карт: #{@player.amount_cards}"
  end

  def bet
    @player.bank_pull
    @dealer.bank_pull
  end

  def turn_player
    @player.hold_cards << @deck.give_cards(2)
  end

  def turn_dealer
    @dealer.hold_cards << @deck.give_cards(2)
  end

  def distribution_of_cards
    @deck.create_deck
  end

  def screenplay
    7.times do
      sleep(0.3)
      print "."
    end
  end
end

start = Main.new
start.welcome
loop do
  start.begin_play
  start.actions
  choose = gets.chomp.to_i
  start.exec_actions(choose)
end
