# Chat server code goes here

require 'socket'

server = TCPServer.new 2000

puts "Starting server..."
loop do
  Thread.start(server.accept) do |client|
    input = ""
    puts "A new client connected!"
    puts client
    until input == "close"
      input = client.gets.chomp
      puts "Client says: #{input}"
      client.puts "Server says: Hello!"
      client.puts "Polly say: #{input}"
    end
    client.close
  end
end

