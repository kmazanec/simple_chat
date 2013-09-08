# Chat client code goes here

$LOAD_PATH << './'

require "socket"
require "helpers.rb"

client_session = TCPSocket.new( "localhost", 2008 )

print "Enter your name: "
input = gets.chomp

client_session.puts input
# puts client_session.gets
# puts client_session.gets


until client_session.closed?
  Thread.start do
    loop do
      message = client_session.gets
      puts "Server says: #{message}"
      print "> "
    end
  end

  Thread.start(gets.chomp) do |user_input|
    client_session.puts user_input
    client_session.close if user_input == "exit"
  end
end

  

