#Rock, Paper, Scissors

while true
  possible_moves = ["rock", "paper", "scissor"]
  ai_move = possible_moves.sample
  print "what's your move? "
  input = gets.chomp.downcase
  until input == "rock" || input == "paper" || input == "scissor"
    puts "Don't know that command, choose rock, paper, or scissor"
    input = gets.chomp.downcase
  end
  puts "The computer chooses #{ai_move}"
  win_message = "#{input} trumps #{ai_move}. You win!"
  lose_message = "#{ai_move} trumps #{input}. Computer wins!"
  if input == ai_move
    puts "Oh noes, it's a tie!"
  elsif input == "rock" && ai_move == "scissor"
    puts win_message
  elsif input == "rock" && ai_move == "paper"
    puts lose_message
  elsif input == "paper" && ai_move == "rock"
    puts win_message
  elsif input == "paper" && ai_move == "scissor"
    puts lose_message
  elsif input == "scissor" && ai_move == "paper"
    puts win_message
  elsif input == "scissor" && ai_move == "rock"
    puts lose_message
  end
  puts ""
  puts "===NEW GAME==="
  puts ""
end



