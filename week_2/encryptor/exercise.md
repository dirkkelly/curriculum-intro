#Iteration 1

###create a mapping for each letter in the alphabet with another letter.
This is refered to as a `rot` sequence, where rot is short for `rotate`.
example rot-1 sequence
```
Original Value:New Value
A:B
B:C
C:D
D:E

As you can see, each value is shifted or rotated by 1 letter
```

####Rotated Hash Encryption
```
     {'a' => 'n', 'b' => 'o', 'c' => 'p', 'd' => 'q',
     'e' => 'r', 'f' => 's', 'g' => 't', 'h' => 'u',
     'i' => 'v', 'j' => 'w', 'k' => 'x', 'l' => 'y',
     'm' => 'z', 'n' => 'a', 'o' => 'b', 'p' => 'c',
     'q' => 'd', 'r' => 'e', 's' => 'f', 't' => 'g',
     'u' => 'h', 'v' => 'i', 'w' => 'j', 'x' => 'k',
     'y' => 'l', 'z' => 'm'}

```

**Hint:** Using a `hash` is a great option when needing to map one value to another
```
hash syntax #=> {"dog" => "midnight", "cat" => "pinky"}
```

###Create a method called `encrypt` that will intake a `string ` as an argument and encrypt each letter.
Use your newly created encryption mapping saved in the hash.

**Hint:** A method with an argument looks like the following

```
def shout(word)
 <shouting logic here>
end
```

**Hint:** To break a string into an array of its component letters use the `split` method
```
"super_hot_soup".split("_") #=> ["super", "hot", "soup"]
```

**Hint:** Once you have an `array` of letters, you can loop through each one, encrypt it, then store it in a new array. To store new value in an array use the `<<` method.  Known as the shovel operator.
```
[1,2,3] << 4 #=> [1,2,3,4]
```
**Hint:** To convert an array to a string, use the `join` method.
```
["k","a","n","y","e"].join("") #=> "kanye"
```

###Create a method called `decrypt` that takes a `string ` as an argument and returns it's original (readable) value.
**Hint:** You should have all the tools you need to solve this from the above encrypting method.  Now you just need to do it in reverse.

###Sample out of the program
```
word = "batman"

secret_word = encrypt(word)
  #=> "htnmnu"

decoded_word = decrypt(secret_word)

puts decoded_word
  #=> "batman"
```

#Iteration 2
One problem with our above `encrypt` method is that if we pass in a capitalized letter, our hash will not recognize the letter. We need to fix that.

###Create a method called `clean` that will take a string and downcase it.

**Hint:** The method `downcase` when called on string maybe of some help!

# Extensions

* Write a program to crack other people's rot cipher without knowing how many characters they rotate each letter.
* It is very easy to crack the rot cipher. Write a more secure cipher.






