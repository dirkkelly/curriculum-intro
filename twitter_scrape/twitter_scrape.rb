#download all tweets for a given user
#save the twitter xml data to file
#parse the xml and format tweets to human readable
#do some analysis: tweet frequency, 5 most popular tweets, 25 most popular words used

require 'open-uri'
require 'crack'
require 'time'

base_url = "http://api.twitter.com/1/statuses/user_timeline.xml?count=100&screen_name="
user_name = "verdi_michael"
base_file_name = "twitter_data_for_"

unless File.exists?(base_file_name + user_name)
  twitter_data = open(base_url + user_name).read
  local_copy = File.new(base_file_name + user_name, "w")
  local_copy.write(twitter_data)
  local_copy.close
end

twitter_file = open(base_file_name + user_name).read
parsed_xml = Crack::XML.parse(twitter_file)
tweets = parsed_xml['statuses']


#List all tweets

all_tweets = File.new("all_tweets", "w")
tweets.each do |tweet|
  all_tweets.write "Created at: #{Time.parse(tweet['created_at']).strftime("%b %d, %Y")}" + "\n"
  all_tweets.write "Tweet: #{tweet['text']}" + "\n"
  all_tweets.write "Retweet Count: #{tweet['retweet_count']}" + "\n"
  all_tweets.write "===" + "\n"
end

all_tweets.close

#5 Most popular tweets

most_popular = File.new("most_popular", "w")
hash = {}

tweets.each do |tweet|
  hash[tweet['text']] = tweet['retweet_count']
end

order_tweets = hash.sort_by {|k,v| v}.reverse
top_five = order_tweets[0...5]
top_five.each do |tweet|
  most_popular.write "Retweets: #{tweet[1]}" + "\n"
  most_popular.write "Tweet: #{tweet[0]}" + "\n"
  most_popular.write "===" + "\n"
end

most_popular.close

#25 most popular words over 4 characters

most_used_words = File.new("most_used_words", "w")
all_words = []
words_by_count = Hash.new(0)

tweets.each do |tweet|
  all_words << tweet['text'].split(" ")
end

all_words.flatten.each do |word|
  word.gsub!(/\W*/, '')
  words_by_count[word] += 1
end

#to filter out common words like it, she, the etc...
words_over_four_chars = words_by_count.select {|k,v| k.length > 4}

words_over_four_chars.sort_by{ |k, v| v }.reverse[0...25].each do |k,v|
  most_used_words.write "#{k}: #{v}\n"
end

most_used_words.close

#most popular day for tweeting

days = []

tweets.each do |tweet|
  days << Time.parse(tweet['created_at']).strftime("%A")
end

monday_count = 0
tuesday_count = 0
wednesday_count = 0
thursday_count = 0
friday_count = 0
saturday_count = 0
sunday_count = 0

days.each do |day|
  if day == "Monday"
    monday_count += 1
  elsif day == "Tuesday"
    tuesday_count += 1
  elsif day == "Wednesday"
    wednesday_count += 1
  elsif day == "Thursday"
    thursday_count += 1
  elsif day == "Friday"
    friday_count += 1
  elsif day == "Saturday"
    saturday_count += 1
  elsif day == "Sunday"
    sunday_count += 1
  end
end

File.open("tweets_by_day", "w") do |f|
  f.write "Monday: #{monday_count}\n"
  f.write "Tuesday: #{tuesday_count}\n"
  f.write "Wednesday: #{wednesday_count}\n"
  f.write "Thursday: #{thursday_count}\n"
  f.write "Friday: #{friday_count}\n"
  f.write "Saturday: #{saturday_count}\n"
  f.write "Sunday: #{sunday_count}\n"
end

#combining all created text files thus far
f1 = open(all_tweets).read
f2 = open(most_popular).read
f3 = open(most_used_words).read
f4 = open("tweets_by_day").read

File.open("tweets_with_analysis", "w") do |f|
  f.write "Last 100 Tweets\n"
  f.write "\n"
  f.write f1
  f.write "\n"
  f.write "===================\n"
  f.write "Analysis of Tweets\n"
  f.write "===================\n"
  f.write "\n"
  f.write "5 Most Popular Tweets\n"
  f.write "\n"
  f.write f2
  f.write "\n"
  f.write "25 Most Popular Words Used in Tweets\n"
  f.write "\n"
  f.write f3
  f.write "\n"
  f.write "Most Popular Days of the Week for Tweeting\n"
  f.write "\n"
  f.write f4
end