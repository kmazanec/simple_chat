# Chat client code goes here

server = TCPSocket.open('localhost',2000)


puts "Connected to server at localhost"
until server.closed?
  puts "Say something (close to close): "
  input = gets.chomp
  server.puts(input)
  while line = server.gets
    puts line.chop
  end
  break if input == "close"
end

server.close