while true
  #mirror should prompt for question
  print "ask mirror: "

  #we should get our feedback
  question = gets.chomp.downcase

  #check to see if one of four conditions is met
  #conditions
  if question == "what time is it?"
    puts "great question"
  elsif question == "how was breakfast?"
    puts "something else"
  elsif question == "do i have my phone?"
    iphone_version = rand(10) + 1
    puts "no i never have my iphone #{iphone_version}"
  elsif question == "time to code?" #=> this is the break condition
    puts "always time to code"
    break
  else
    puts "yes"
  end
end

