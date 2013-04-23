#Obnoxious 3rd Person Referencing Boss
**Learning Goal:** Show the importance of being able to save data to cut down on repetition
**Task:** Change the bosses name from `Michael` to `Obama`

    puts "Michael had a great weekend"
    puts "Michael went and got a message and then feeling great Michael decided to run a marathon"
    puts "Michael was then tired so Michael went to his rooftop pool"
    puts "Michael soaked up some sun while programming pool side."


#Oh You Fancy, Huh
**Learning Goal:** Show proper syntax for creating a valid variable
**Task:** Given the following wannabe variables.  Write out which variables are valid and which are not.

###Variable Rules
* Start off with a lowercase letter
* Don't use spaces or punctuation, except for underscores. e.g. my_first_variable
* You can use numbers – but not as the first character – and uppercase letters. But to keep things simple, just stick to lowercase characters and underscores

    [march_madness]
    dog
    "cat"
    passw0rd
    webpage-url
    game!of!thrones
    mcKinley_Mountain
    100baby_names
    xxxSweetGamerTagxxx


#Mad Lib Variable Name
**Learning Goal:** Show that variables are just references to values - they are not defined by them.
**Task:** Run the program initially and see its output.  Then change all the variable names to whatever you like.  What is the outcome of the program now?

    name = "james"
    name_capitalized = name.capitalize
    boy_age = 10
    tree_age = 200
    peach_age = tree_age - 100
    tree_type = "peach"
    peach_size = "giant"

    "#{name_capitalized} is #{boy_age} when he finds a #{peach_age} year old #{peach_size} #{tree_type}"
    #=>"james is 10 when he finds a 100 year old giant peach"


#Political Flip Flopper
**Learning Goal:** Reinforce that variables are references / pointers to a value.
**Task:** Kayne is a bit confused.  He meant to say `Greatest` `Ever` but his lyrics say `Ever` `Greatest`.  Each word is stored in a variable below.  Write a script that switches the values of each variable with each other.


    given variables a and b, write a script that swaps their values

    a = "Ever"
    b = "Greatest"

    your awesome changing logic

    a = "Greatest"
    b = "Ever"

    puts "Kayne says: When it comes to rapping, I'm the #{a + b}"



