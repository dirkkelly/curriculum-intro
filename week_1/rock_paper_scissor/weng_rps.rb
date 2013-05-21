class Game
  WINNERS = {"rock" => "scissors", "paper" => "rock", "scissors" => "paper"}
  @@past_moves = []
  attr_accessor :move, :ai_move
  MOVES = 2

  def play
    puts "Welcome to Rock Paper Scissors - AI edition\nTo end a game type 'quit'"

    while true
      print "What's your move: rock, paper, or scissors? "
      @move = get_move
      break if @move == "quit"
      result = winner(@move, ai_move)
      @@past_moves << @move
      print_message(result)
    end
  end

  def get_move
    gets.chomp
  end

  def print_message(result)
    print "#{@move} vs. #{@ai_move}: "
    if result == true
      puts "You won!"
    elsif result == false
      puts "You lose!"
    else
      puts "You tied!"
    end
  end

  def ai_move
    move_sequence = @@past_moves.slice(-MOVES, MOVES)
    @ai_move = winner_against(predicted_move(move_sequence))
  end

  def winner_against(move)
    WINNERS.find{ |k, v| v == move }.first
  end

  def predicted_move(move_query)
    next_moves = @@past_moves.each_cons(MOVES + 1).each_with_index.map do |chunk, i|
      chunk.last if move_query == chunk.slice(0, MOVES)
    end.compact

    puts "YOUR PREDICTED MOVE: #{next_moves.mode}" if next_moves.any?

    next_moves.any? ? next_moves.mode : ["rock", "paper", "scissors"].sample
  end

  def winner(move_one, move_two)
    return nil if move_one == move_two
    WINNERS[move_one] == move_two ? true : false
  end
end

class Array
  def mode
    self.group_by{ |x| x }.values.max_by(&:size).first
  end
end

Game.new.play