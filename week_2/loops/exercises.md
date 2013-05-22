#Working With Each
**Learning Goal:** Practice using the `each` method
**Task:** Loop thru the animals array and perform the necessary actions
**Reference:**
```
[1,2,3].each do |number|
  puts number
end
 #=> 1
 #=> 2
 #=> 3
```

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