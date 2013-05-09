class CardCalc
  attr_accessor :players_card, :computers_card, :winner, :loser, :tie

  def initialize(players_card, computers_card)
    @player_card   = players_card
    @computer_card = computers_card
    @winner        = nil
    @loser         = nil
    @tie           = false
  end

  def calculate
    if @player_card.value > @computer_card.value
      @winner = "player"
      @loser = "computer"
    elsif @computer_card.value > @player_card.value
      @winner = "computer"
      @loser = "player"
    else
      @tie = true
    end
    self
  end
end