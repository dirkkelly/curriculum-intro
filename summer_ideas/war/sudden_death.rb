require_relative "all_files.rb"

class SuddenDeath
  attr_accessor :player, :computer, :winner, :loser

  def initialize(player,computer)
    @player = player
    @computer = computer
    @winner = nil
    @loser = nil
  end

  def determine_winner
    still_tied = true
    round = 1
    while still_tied
      puts "Sudden Death Round: #{round}"
      player_card = player.go
      computer_card = computer.go
      break if player_card == nil || computer_card == nil
      if player_card.first.value > computer_card.first.value
        puts "player wins"
        @winner = "player"
        @loser = "computer"
        still_tied = false
      elsif computer_card.first.value > player_card.first.value
        puts "computer wins"
        @winner = "computer"
        @loser = "player"
        still_tied = false
      else
        round += 1
        puts "Amazing, another tie"
      end
    end
    if player_card == nil
      puts "You don't have any cards left to compete"
      @winner = "computer"
      @loser = "player"
    elsif computer_card == nil
      puts "Computer does not have any cards left to compete"
      @winner = "player"
      @loser = "computer"
    end
    self
  end
end