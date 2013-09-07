#Method Man
**Learning Goal:** Practice syntax, structure, and argument use when creating methods

**Reference:**
```
Outline of a sample method

def martian_name(name)
  <logic that converts name to a martian name>
end
```
**Task:** Create the method needed to solve the outlined problem

####1: Write a method that will take a word as an argument and uppercases it and adds a "!"
```
shout("billy") #=> "BILLY!"
```

####2: Write a method that takes 2 arguments.  The 1st argument should be a number and the 2nd should be the divisor.
**Hint:** Remember to put a check inside your method so that you cannot divide by zero
```
divide(10,5) #=> 2
divide(20,0) #=> "Sorry, can't divide by zero"
```

####3: Write a method that creates a mad libs joke.  The method should take 3 arguments a noun, verb, and an adverb.
Use the below format as the outline for your method
```
A <noun> <verb> into a bar.
Wow this joke is already <adv> funny!

bar_joke("dolphin", "flys", "eternally")
 #=> "A dolphin flys into a bar.  Wow, this joke is already eternally funny!"

```

####4: Write a method that will correctly format a phone number.  The method should take 1 argument; a phone number as a string.
**Hint** You can use the bracket notation [] on an array to pull a single or multiple values out
```
format_phone_number("2813308004") #=> (281) 330-8004

```
**Extension** Make the method more robust so that it can handle either a string or an integer passed in as an argument.
```
format_phone_number("2813308004") #=> (281) 330-8004
format_phone_number(2813308004)   #=> (281) 330-8004
```



