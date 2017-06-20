class Player

  attr_accessor :name, :bank, :hold_cards

  START_BANK = 100
  PICTURES = %w(Q K A)

  def initialize(name)
    @name = name
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
    @hold_cards.each do |value, suit|
      puts "#{value} #{suit}"
    end
  end

  def pictures_array
    PICTURES.each {|item| puts item}
  end

  def drop_cards
    @holds_cards.clear
  end

  def amount_cards
    @hold_cards.flatten.each.with_index(1) do |item, index|
      @sum += item if (index %1 == 0)
    end
    print @sum
  end

end
