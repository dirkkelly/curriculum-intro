limit = rand(200)

random_number = rand(limit) + 1
guess = 0
tries = 0
begin
  tries = tries + 1
  puts "Guess a number between 1 and #{limit}, you have five tries"
  guess = gets.chomp.to_i
  if guess > random_number
    puts "Too high, try again!" unless tries == 5
  elsif guess < random_number
    puts "Too low!" unless tries == 5
  elsif guess == random_number
    puts "Congratiolations! You won!"
  end
end until guess == random_number or tries == 5

if tries == 5
  puts "That was your 5th try. Game over! Play again!"
end