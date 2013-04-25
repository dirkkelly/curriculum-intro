#Array to Hash Conversion
**Learning Goal:** Understand the basic syntax of a hash and how to create

**Task:** You have an array of arrays where the first value is the person's name and the second value is their phone number.  You want to convert this data into a hash so that you can easily lookup a given friend's name so you can call them.

```
friends_list = [["obama", "4108529630"], ["kayne", "4108529630"], ["jay-z", "4108529630"], ["flacco", "4108529630"], ["rock", "4108529630"], ["carter", "4108529630"], ["lil-wayne", "4108529630"]]

your_awesome_script

=> { "obama" => "4108529630" }
```

#Word Profile
**Learning Goal:**  Building a hash from an array, setting keys, retrieving values and incrementing those values, printing hash key and values.

**Task:** Given a string with any number/type of characters build a hash that tracks the frequency of each character in the given string.

```
word_profiler("fizzbuzz")

Profile of Fizzbuzz:
f: 12.5%
i: 12.5%
z: 50.0%
b: 12.5%
u: 12.5%
```

#Scrabble Score
**Learning Goal:** Hash lookup table, retrieving data, inserting data

**Task:** Write a method that when passed a word will return that words scrabble score.  The table below shows the values for each letter in the alphabet.

**Hint:** Make a hash that stores each letter with its given value.  Use `String#split` to break a string into an array of its individual characters.

```
Letter                           Value
A, E, I, O, U, L, N, R, S, T       1
D, G                               2
B, C, M, P                         3
F, H, V, W, Y                      4
K                                  5
J, X                               8
Q, Z                               10


scrabble_score("cabbage")
=> 14
```


