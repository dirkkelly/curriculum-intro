require 'faraday'
require 'json'
require 'time'

MESSENGR_URL = ENV['PROD'] ? "http://messengr.herokuapp.com/messages" : "http://localhost:3000/messages"

@connection = Faraday.new(:url => MESSENGR_URL)

def get_new_messages(last_message_id = 0)
  response = @connection.get do |req|
    req.params['last_message_id'] = last_message_id
  end
  response.body
end

def parse(messages)
  JSON.parse(messages)
end

def format_time(time)
  Time.parse(time).strftime("%I:%M%p")
end

puts "Welcome to Messengr"

last_message_id = 0

while true
  messages = parse(get_new_messages(last_message_id))
  last_message_id = messages.last["id"] if messages.any?
  messages.each do |msg|
    puts "[At #{format_time(msg["created_at"])}] #{msg["user"].capitalize} says: #{msg["text"]}"
    puts "-"
  end
  sleep 2
end