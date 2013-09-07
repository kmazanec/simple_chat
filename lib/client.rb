# Chat client code goes here

require "socket"

# module Message_Passing
#   $current_message = "blank"
#   def set_current_message(message)
#     $current_message = message
#   end

#   def get_current_message
#     $current_message
#   end
# end

# class TCPSocket
#   include Message_Passing
# end

client_session = TCPSocket.new( "localhost", 2008 )

print "Enter your name: "
input = gets.chomp

client_session.puts input
puts client_session.gets
puts client_session.gets

until client_session.closed?

  print "Enter message :  "
  msg = gets.chomp
  client_session.puts msg
  break if msg == "exit"
  puts client_session.gets
  # puts client_session.get_current_message
end

client_session.close
  
# server = TCPSocket.open('localhost',2000)

# puts "Server name: #{server.name}"

# puts "Connected to server at localhost"
# until server.closed?
#   puts "Say something (close to close): "
#   input = gets.chomp
#   server.puts(input)
#   line = server.gets
#   puts line.chop
#   break if input == "close"
# end

# server.close
