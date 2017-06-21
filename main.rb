#class Main
require_relative 'Player'
require_relative 'Deck'
require_relative 'HumanPlayer'
require_relative 'ComputerPlayer'

class Main
  attr_accessor :player, :dealer, :sum

    def initialize
      @player = player
      @dealer = dealer
      @deck = Deck.new
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
    when 3
      open_cards
    end
  end

  def welcome
    system 'cls'
    puts "Введите ваше имя: "
    @name = gets.capitalize.chomp
    @player = HumanPlayer.new(@name)
    @dealer = ComputerPlayer.new
    puts "Добро пожаловать в игру Black Jack, #{@name}"
    puts "Сейчас на Вашем счету #{player.bank_player} монет"
  end

  def begin_play
    50.times{print "-"}
    puts "\nПеремешиваем колоду и раздаем каждому по 2 карты: "
    screenplay
    distribution_of_cards
    puts "\nУ вас на руках: "
    turn_player
    @player.show_cards
    puts "Итого очков: #{@player.amount_cards}"
    bet
    puts "Ставка в банк 10 монет. На вашем счету: #{@player.bank}"
    turn_dealer
    puts @dealer.amount_cards
    puts "У дилера на руках **********"
  end

  private

  def open_cards
    puts "Вскрываем карты: "
    puts "Карты игрока: #{@player.show_cards} | Очков: #{@player.amount_cards}"
    puts "Карты дилера: #{@dealer.show_cards} | Очков: #{@dealer.amount_cards}"
    if  21-@player.sum < 21-@dealer.sum
      puts "Вы победили!!!"
    elsif
      21-@player.sum == 21-@dealer.sum
      puts "Ничья"
    else
      puts "Дилер выйграл"
    end
  end

  def dealer_choose
   puts "Ход перешел к дилеру."
   screenplay
   if (@dealer.amount_cards <= 10)
     @dealer.hold_cards << @deck.give_cards(1)
     puts "Дилер взял одну карту. Ход перешел к Вам."
     actions
   else
     puts "Дилер не взял карту. Ход перешел к Вам."
     actions
   end
  end

  def player_choose
    @player.hold_cards << @deck.give_cards(1)
    @player.show_cards
    puts "Итого очков по итогу 3х карт: #{@player.sum}"
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
      sleep(0.1)
      print "."
    end
    puts
  end
end

start = Main.new
start.welcome
start.begin_play
loop do
  start.actions
  choose = gets.chomp.to_i
  start.exec_actions(choose)
end
