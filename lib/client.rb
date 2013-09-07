# Chat client code goes here

require "socket"

module Message_Passing
  $current_message = "blank"
  def set_current_message(message)
    $current_message = message
  end

  def get_current_message
    $current_message
  end
end

class TCPSocket
  include Message_Passing
end


begin
 clientSession = TCPSocket.new( "localhost", 2008 )
 
rescue StandardError
  puts "Error !! "
else


  while !(clientSession.closed?)

    print "Enter message :  "
    msg = gets.chomp
    clientSession.puts msg
    puts clientSession.gets
    # puts clientSession.get_current_message
  end

end



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