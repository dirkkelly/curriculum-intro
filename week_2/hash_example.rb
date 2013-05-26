#string interpolation
#counters
#explicit array vs variable
#using block variable multiple times

#looping thru array containing numbers
[1,2,3].each do |number|
  puts number
end

numbers = [1,2,3]
numbers.each do |number|
  puts number
end


#looping thru an array containing strings
["bill", "tim", "carl"].each do |person|
  puts person
end

#looping thru an array containing arrays
counter = 1
sneakers = [["nike", 1, "basketball"], ["adidas", 2, "cleat"], ["puma", 3, "casual"]]
sneakers.each do |sneaker|
  puts "each sneaker is a #{sneaker.class}"
  puts "here is sneaker #{counter}: #{sneaker}"
  puts ""
  counter = counter + 1
end

#looping thru an array containing hashes
friends = [
            {"name" => "kanye", "job" => "rapper", "location" => "chicago", "age" => 32 },
            {"name" => "obama", "job" => "president", "location" => "dc", "age" => 50},
            {"name" => "nyan", "job" => "internet_meme", "location" => "internet", "age" => 9001}
          ]

counter = 1
friends.each do |friend|
  puts "#{counter}----"
  puts "each friend is a #{friend.class}"
  puts "here is the hash: #{friend}"
  counter = counter + 1
end








