# Chat server code goes here

require 'socket'

# server = TCPServer.new 2000

# puts "Server name: #{server.name}"


module Message_Passing
  $current_message = "empty"
  def set_current_message(message)
    $current_message = message
  end

  def get_current_message
    $current_message
  end
end

class TCPServer
  include Message_Passing
end

server = TCPServer.new(2008)

# connection = server.accept
loop do
  Thread.start(server.accept) do |connection|
# connection.puts "HELLO"
    name = nil
    while (input = connection.gets.chomp)
      puts input

      # set_current_message(input)

      input_array = input.split(" ")
      word1 = input_array[0]
      word2 = input_array[1]
      word3 = input_array[2]
      word4 = input_array[3]

      if input == "What time is it?"
        connection.puts "The current local time is #{Time.now.to_s}"
      elsif word1 == "My" && word2 == "name" && word3 == "is"
        name = word4
        connection.puts "Ok, I'll call you #{name} from now on!"
      elsif !name.nil?
        connection.puts "I can't let you do that, #{name}."
      else
        connection.puts "I can't let you do that, Dave."
      end
    end
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

