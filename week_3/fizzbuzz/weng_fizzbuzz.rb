class FizzBuzz
  def divisible?(number, divisor)
    (number % divisor) == 0
  end

  def fizz_buzz(number)
    "#{'Fizz' if divisible?(number, 3) }#{'Buzz' if divisible?(number, 5) }"
  end

  def run
    (1..100).each do |x|
      puts "#{x}: #{fizz_buzz(x)}" unless fizz_buzz(x).empty?
    end
  end
end

FizzBuzz.new.run