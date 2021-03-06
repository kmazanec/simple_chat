# Chat server code goes here

$LOAD_PATH << './'

require 'socket'
require 'helpers.rb'

server = TCPServer.new(2008)

puts "Starting chat server..."



=begin
  Have a users object that creates a new user each time someone connects
  Each user will have a history of their own messages
  Each user will have a unique session id
  When a new user connects, send them the messages of the other users
  Figure out to have conditional gets-ing and puts-ing working
  Right now we have to have a one-to-one system
  
  What if the client opens a new Thread to listen to other users messages?
  That thread could be adding to a messages data structure that we could check
  for newness each time around the loop
  It would run in the background


=end

users = []

connections = []

loop do
  puts "Loop"
  Thread.start(server.accept) do |connection|
    connections << connection

    name = connection.gets.chomp
    connection.puts "HELLO, #{name}"
    puts "A new user connected: #{name}"
    if users.any?
      connection.puts "Users currently connected: #{users}" 
    else
      connection.puts "No other users connected."
    end
    users << name

    while (input = connection.gets.chomp)
      if input == "exit"
        connection.close
        break
      end
      puts "[#{name}]: #{input}"

      connections.each do |person|
        person.puts "[#{name}]: #{input}"
      end
      # connection.puts "#{input}?"
      # set_current_message(input)
    end
    puts "Client: #{name} disconnected"
  end
end




# puts "Starting server..."
# loop do
#   Thread.start(server.accept) do |client|
#     input = ""
#     puts "A new client connected!"
#     puts client

#     while (input = client.gets.chomp) && (input != "close")
#       puts "Client says: #{input}"
#       client.puts "Server says: Hello!"
#       client.puts "Polly say: #{input}"
#     end
#     client.close
#     puts "Client disconnected"
#   end
# end

