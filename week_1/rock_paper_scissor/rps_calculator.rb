class RPSCalculator
  def initialize(player_move, computer_move)
    @player_move   = player_move
    @computer_move = computer_move
    @result        = nil
  end

  def player_move
    @player_move
  end

  def computer_move
    @computer_move
  end

  def result=(string)
    @result = string
  end

  def result
    if @result == nil
      puts "Please run the #calculate method first"
    else
      @result
    end
  end

  def calculate
    if player_move == computer_move
      result = "tie"
      puts tie_message
    elsif player_move == "rock" && computer_move == "paper"
      result = "loss"
      puts lose_message
    elsif player_move == "rock" && computer_move == "scissors"
      result = "win"
      puts win_message
    elsif player_move == "paper" && computer_move == "scissors"
      result = "loss"
      puts lose_message
    elsif player_move == "paper" && computer_move == "rock"
      result = "win"
      puts win_message
    elsif player_move == "scissors" && computer_move == "rock"
      result = "loss"
      puts lose_message
    elsif player_move == "scissors" && computer_move == "paper"
      result = "win"
      puts win_message
    end
  end

  def win_message
    "You Win: #{player_move.upcase} trumps #{computer_move.upcase}"
  end

  def lose_message
    "You Lose: #{computer_move.upcase} trumps #{player_move.upcase}"
  end

  def tie_message
    "Tie Game: Both chose #{player_move.upcase}"
  end
end
