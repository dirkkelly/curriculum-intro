#Working With Each

Computers are great at something you and I are not; doing something over and over and over again. We get bored
easily. Computers do not. Loops are what computers use to make our lives easier.

**Learning Goal:** Practice using the `each` method

**Reference:**
```
[1,2,3].each do |number|
  puts number
end
 #=> 1
 #=> 2
 #=> 3
```

**Task:** Loop thru the animals array and perform the necessary actions
```
animals = ["zebra", "lion", "kangaroo", "turtle", "squirrel", "chipmunk", "elephant", "dragon", "t-rex", "pikachu"]

```
###1: Capitalize all the animals names
```
zebra #=> Zebra
```
###2: Uppercase all of the animals names
```
zebra #=> ZEBRA
```
###3: Print the animals name with the total length of characters in its name
```
zebra - 5
lion - 4
kangaroo - 8
```
###4: Starting with 1, print out each animal with the number they appear in the array
**Hint:** You will need to create a counter, so each time you go thru the array it adds 1 (x = x + 1)
```
1 - zebra
2 - lion
3 - kangaroo
```

###5: There are 3 animals that don't really exist currently.  Loop thru the array and only show the living animals
**Hint:** You will need to write a conditonal (unless animal == "x,y,z")
```
zebra
lion
kangaroo
turtle
squirrel
chipmunk
elephant
```
###6: Now only print the animals that don't exist currently
```
dragon
t-rex
pikachu
```

# Working With While

### Task

You have a Grandma that's hard of hearing. Write a program containing a while loop that does the following

* Whatever you say something to Grandma (whatever you type in), she can't hear you and responds like:
```HUH?! SPEAK UP, SONNY!```
* Whenever you shout (type in all capital letters), she can hear you (or at least she thinks so) and yells back:
```NO, NOT SINCE 1938!```
* Grandma should shout a random between 1930 and 1975.
* Grandma loves you very much and doesn't want you to leave. When you shout BYE, she pretends not to hear you.
You have to shout BYE three times in a row to leave (exit the program)

### Hints

If you forgot, asking for user input can be done with `gets.chomp`

While loops look like
```
while true
  # your code goes here
end
```

Example Output

```
> hello
HUH?! SPEAK UP, SONNY!
> HELLO
NO, NOT SINCE 1938
> WOAH
NO NOT SINCE 1945
> BYE
You were such a cute baby
> BYE
Would you like some candy
> BYE
Goodbye!
```
