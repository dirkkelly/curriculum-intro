(0..50).each do |num|
  if num % 3 == 0 and num % 5 == 0
    puts "Fizz"
  elsif num % 3 == 0
    puts "Buzz"
  elsif num % 5 == 0
    puts "FizzBuzz"
  else
    puts num
  end
end