#Where's Waldo
**Learning Goal:** Practicing retrieving and inserting values from/into an array

**Task:** Each of the following arrays contains a value named "Waldo".  Return "Waldo" from the array using the `[]`, `first`and `last` methods.

```
For example
["a", "b", "c"][2] #=> "c"

["waldo", "sparky", "gi joe", "chipotle"]
["lakers", "spurs", "thunder", "waldo", "boston"]
[1, "waldo", "clouds", "4tran", 'ruby']
['sony', [:so_cool, :happy, "train", "waldo"], "chimney"]
["car", "boat", 1, "iceberg", "waldo"]
```

**Task:** For each of the following arrays, replace "place_waldo_here" with the actual value of "waldo".  Try using both the `[]`, `first` and `last` methods.

**Note:** You cannot just hit delete and type waldo in, you must do so programmtically.

```
For example
a = ["a", "b", "c"] a[2] = "bling" #=> ["a", "b", "bling"]

b = ["dc", "md", "place_waldo_here"]
c = ["15", "train", ["movies", "dates"], "place_waldo_here", "w"]
d = ["a", 4, "y", [:car, "laptop, "place_waldo_here"], "g", :f]
e = ["place_waldo_here", "lamp", "mouse", "headphones", "objects around me now"]
```

#Houston, We Have Liftoff
**Learning Goal:** Iterating through the values in an array

**Task:** Write a script that does a countdown from 10 to 1.  After the last value '1' it should say "Houston, we have liftoff"

```
10
9
8
7
6
5
4
3
2
1
"Houston, we have liftoff"
```

#Dirty Zipcodes
**Learning Goal:** Iterate through the values in an array, use conditional logic and add values to a new array

**Task:** You are creating a petition to get Lil Wayne to perform at your school.  To get enough signatures you need to mail the petition to 20 different zipcodes.  But, there is a problem.  The zipcodes you got offline are not uniform.  The trailing "0s" have been cut off for zipcodes ending in "0".  To mail correctly, all the zipcodes need to have 5 digits long.  Go through the zipcodes array and add the necessary amount of "0s" to each zipcode.

**Hint:** The to_s method converts an integer to a string

```
zipcodes = [72982, 695, 1822, 92966, 892, 9802, 44291, 23665, 328, 5640, 18968, 305, 885, 70403, 45886, 1369, 3731, 26079,85846, 42534]


Result should look like:

[72982, 69500, 18220, 92966, 89200, 98020, 44291, 23665, 32800, 56400, 18968, 30500, 88500, 70403, 45886, 13690, 37310, 26079, 85846, 42534]
```


#Kick It In Reverse
**Learning Goal:** Array manipulation and adding new values to a new array

**Task:** Given an array of numbers, write a script that will reverse their order. (You cannot use the built in method Array#reverse)

**Hint:** The methods `push` and `pop` maybe helpful!  `push` will add a new value to the end of an array and `pop` will take the last value out of an array.

```
my_golf_scorecard = [1,2,3,4,5]

your_awesome_script

my_golf_scorecard = [5,4,3,2,1]
```





