# Brain Refresh

It's early and I haven't had my coffee yet. Let's review what we've learned in the past couple of weeks and get
the brain meats flowing.

# Instructions

* Create an `Array` containing at least 3 names of your favorite song artists.

```
# In case your forgot, you can create array like this
singers = []
```

* Loop over each song artist name and print what you think of them. For example, 

```
Paramore was the best concert ever.
Fallout Boy is back!
Ke$ha love your music, but please take out the dollar sign in your name.
```

# Extensions

* Create a command line program where entering a song artist name returns their songs. Hint: Create a Hash of 
artist to songs.

```
# This is how to collect user input
gets.chomp

# This is how to create a hash
{ "Paramore" => "Misery Business" }
```

* Create a `SongArtist` class with the following methods: `songs` and `name`

You should be able to create new SongArtist instances and return it's name and songs.

```
song_artist = SongArtist.new("Paramore")
song_artist.name # => "Paramore"
song_artist.songs # => ["Misery Business", "Crush Crush Crush", "The Only Exception"]
```
