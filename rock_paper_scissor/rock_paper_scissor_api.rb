require 'faraday'
require 'json'
require_relative 'rps_calculator'

connection = Faraday.new(:url => "http://localhost:3000")


puts "Welcome to Rock Paper Scissors - API edition"
puts "To end a game type 'quit'"

while true
  print "What's your move: "
  my_move = gets.chomp
  break if my_move == "quit"
  parsed_response = JSON.parse(connection.get("/computers_moves/new").body)
  computers_move = parsed_response["computers_move"]
  RPSCalculator.new(my_move, computers_move).calculate
end