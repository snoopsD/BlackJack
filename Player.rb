class Player

  attr_accessor :name, :bank, :hold_cards

  START_BANK = 100

  def initialize(name)
    @name = name.capitalize.chomp
    @bank = START_BANK
    @hold_cards = []
  end

  def bank_player
    @bank
  end

  def bank_pull
    @bank -= 10
  end

  def show_cards
    @hold_cards.each do |value|
      puts "#{value[0]} #{value[1]}"
    end
  end

  def drop_cards
    @holds_cards.clear
  end

  def amount_cards
    @sum = 0
    @hold_cards.flatten.each.with_index(1) do |item, index|
      @sum += item if (index %3 == 0)
    end
    print @sum
  end

  def check_ace
    @hold_cards.flatten.each do |item|
      @sum -= 10 if (item == 'A' && @sum >= 10)
    end
  end

end
