require_relative "all_files.rb"

class WarEvent
  attr_accessor :initial_cards, :p_sacrifice_cards, :c_sacrifice_cards
  attr_accessor :p_war_card, :c_war_card, :war_spoils, :winner, :loser, :tie

  def initialize(player, computer)
    @initial_cards     = player.current_card + computer.current_card
    @p_sacrifice_cards = player.go(3)
    @c_sacrifice_cards = computer.go(3)
    @p_war_card        = player.go(1)
    @c_war_card        = computer.go(1)
    @war_spoils        = initial_cards + p_sacrifice_cards + c_sacrifice_cards + p_war_card + c_war_card
    @winner            = nil
    @loser             = nil
    @tie               = nil
  end

  def determine_winner
    if player_wins?
      puts "You have won the war"
      @winner = "player"
      @loser  = "computer"
      @tie    = false
    elsif computer_wins?
      puts "The computer has won the war"
      @winner = "computer"
      @loser  = "player"
      @tie    = false
    else
      puts "Another tie, the war will continue"
      @tie = true
    end
    self
  end

  def player_wins?
    p_war_card.first.value > c_war_card.first.value
  end

  def computer_wins?
    c_war_card.first.value > p_war_card.first.value
  end

end