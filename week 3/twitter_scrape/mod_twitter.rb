require "rest-client"
require "json"

#Data Setup
base_url = "http://api.twitter.com/1/statuses/user_timeline.json?count=100&screen_name="
user_name = "verdi_michael"

data = RestClient.get(base_url + user_name)
tweets = JSON.parse(data)


#List All Tweets

puts tweets.first["user"]["description"]

tweets.each do |tweet|
  puts tweet["user"]["description"]
end

#IN MIDDLE OF RE-WRITING



