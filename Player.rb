class Player

  attr_accessor :name, :bank, :hold_cards

  def initialize(name)
    @name = name
    @bank = bank
    @hold_cards = holds_cards
  end

  def pull_bank
    self.bank = 100
  end
end
