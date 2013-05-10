require_relative "all_files.rb"

class War
  attr_accessor :player, :computer, :winner

  def initialize
    print "What's your name?"
    name = gets.chomp
    puts game_instructions(name)
    puts ""
    cards         = CardDeck.new
    @player       = Player.new(name,Card.convert(cards.deal(26)))
    @computer     = Player.new(Card.convert(cards.deal(26)))
    @winner       = nil
  end

  def game_instructions(user_name)
    "Welcome to War, #{user_name.capitalize}.\n
    First player to get all 52 cards wins.\n
    To end a game earlier type: QUIT"
  end

  def play
    until game_over?
      players_card   = @player.go.first
      computers_card = @computer.go.first
      both_cards     = [players_card] + [computers_card]

      puts "player's card: #{players_card.type}"
      puts "computer's card: #{computers_card.type}"

      result = CardCalc.new(players_card, computers_card).calculate

      if result.tie
        still_tied = true
        war_spoils = []
        war_round = 1
        while still_tied
          if player.not_enough_cards? && computer.not_enough_cards?
            sudden_death_result = SuddenDeath.new(player, computer).determine_winner
            if sudden_death_result.winner == "player"
              player.add_cards(computer.all_remaining_cards)
              still_tied = false
            else
              computer.add_cards(player.all_remaining_cards)
              still_tied = false
            end
          elsif player.not_enough_cards?
            puts "You do not have enough cards to engage in war"
            computer.add_cards(player.all_remaining_cards)
            still_tied = false
          elsif computer.not_enough_cards?
            puts "The computer does not have enough cards to engage in war"
            player.add_cards(computer.all_remaining_cards)
            still_tied = false
          else
            puts "it's a tie, time for WAR##{war_round}"
            puts "dealing out 3 cards each"

            war_result = WarEvent.new(player, computer).determine_winner
            war_spoils += war_result.war_spoils
            still_tied = false if war_result.winner
          end
        end

        if war_result.winner == "player"
          player.add_cards(war_spoils)
        else war_result.winner == "computer"
          computer.add_cards(war_spoils)
        end

        war_spoils.clear

      elsif result.winner == "player"
        puts "player wins"
        player.add_cards(both_cards)
      elsif result.winner == "computer"
        puts "computer wins"
        computer.add_cards(both_cards)
      end

      current_state_of_game
    end
    game_winner
  end

  def game_winner
    if player.total_cards == 0
      puts "The Computer was victorious!"
      @winner = player.name
    elsif computer.total_cards == 0
      puts "#{player.name.capitalize} won the game!"
      @winner = "computer"
    end
  end

  private
  def game_over?
    player.out_of_cards? || computer.out_of_cards?
  end

  def current_state_of_game
    puts "------"
    puts ""
    puts "player's total cards: #{player.total_cards}"
    puts "computer's total cards: #{computer.total_cards}"
  end
end

new_game = War.new
new_game.play


