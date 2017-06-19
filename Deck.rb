class Deck

  attr_accessor :cards

  def initialize
    @value = [*(2..10), "J", "Q", "K", "A"]
    @suits = ["+", "<3", "<>", "^"]
    @cards = []
  end

  def create_deck
    @value.each do |val|
      @suits.each do |suit|
          @cards << [val, suit]
      end
    end
  end

  def give_cards(number)
    @cards.shuffle.shift(number)
  end

  def show
    print @cards
  end


end
