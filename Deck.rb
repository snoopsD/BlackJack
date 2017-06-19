class Deck
  attr_accessor :cards
  attr_reader :value, :suits

  def initialize
    @value = value
    @suits = suits
    @cards = []
    @value = [*(2..10), "J", "Q", "K", "A"]
    @suits = ["+", "<3", "<>", "^"]
  end

  def create_deck
    @value.each do |val|
      @suits.each do |suit|
        @cards << [val, suit]
      end
    end
  end

  def give_cards(number)
    print @cards.shift(number)
  end

end
