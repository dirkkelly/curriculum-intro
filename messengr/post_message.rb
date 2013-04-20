require 'faraday'
require 'json'

MESSENGR_URL = ENV['PROD'] ? "http://messengr.herokuapp.com/messages" : "http://localhost:3000/messages"

print "Welcome to Messengr, what's your username: "
user = gets.chomp
@user = user
@connection = Faraday.new(:url => MESSENGR_URL )

def send_message(message)
  @connection.post do |req|
    req.url '/messages'
    req.headers['Content-Type'] = 'application/json'
    req.body = { :user => @user, :text => message }.to_json
  end
end

while true
  print "Say something: "
  message = gets.chomp
  break if message == "quit"
  response = send_message(message)
end

