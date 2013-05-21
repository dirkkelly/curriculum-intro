def whats_for_dinner
  random_number = rand(4)
  cars = ["ferrari", "civic", "aston martin", "corvette"]
  car = cars[random_number]
  car_hash = {"ferrari" => 1, "civic" => 2, "aston martin" => 3, "corvette" => 4}
  random_value = car_hash[car]
  dinner_picker = random_value - 1
  dinner_options = ["spaghetti", "lentil soup", "pizza", "smoothie"]
  dinner_options[dinner_picker]
end

dinner = whats_for_dinner

puts "Ungrateful Cousin: So you want to make me dinner?  What are you thinking?"
puts "You: #{dinner}"

if dinner == "spaghetti"
  response = "#{dinner.upcase}?: Better have meatballs"
elsif dinner == "lentil soup"
  response = "#{dinner.upcase}?:  Fresh french bread I hope"
elsif dinner == "pizza"
  response = "#{dinner.upcase}? Let's make it from scratch with spinach and artichokes"
elsif dinner == "smoothie"
  response =  "#{dinner.upcase}? Only if it has bananas, mango, and fresh strawberries"
end

puts "Ungrateful Cousin: #{response}"
puts "You: Only the best for you my darling little cousin"
