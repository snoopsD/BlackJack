class Player

  attr_accessor :name, :bank, :hold_cards

  START_BANK = 100
  PICTURES = ["J", "Q", "K"]

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

  def drop_cards
    @holds_cards.clear
  end

  def amount_cards
    @sum = 0
    @hold_cards.each do |sub|
      sub.each do |item|
        item.odd? puts item
      end
    #@hold_cards.
    #  if value == PICTURES
    #    @sum += 10
    #  else
    #    @sum += value
    #  end
  end
  end
end
