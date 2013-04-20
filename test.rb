require 'faraday'
require 'json'

print "Welcome to Messengr, what's your username: "
user = gets.chomp
@user = user
@connection = Faraday.new(:url => "http://localhost:3000" )

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

