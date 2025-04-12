# Write your solution here!
require "rqrcode"

qrcode = RQRCode::QRCode.new("SMSTO:9876543210:Hi Alice! It's")

puts "Chose the kind of QR code you want to create below"
puts "1. URL that opens"
puts "2. Join a WIFI network"
puts "3. Send a message via text"
puts
puts "Press 4 to exit"
puts

kind_of_code = gets.chomp
puts

if kind_of_code.include?("4")
  puts "See you later!"
  exit 

elsif kind_of_code.include?("1")
  puts "What url do you want to use"
  puts

  text_to_encode = gets.chomp
  puts

elsif kind_of_code.include?("2")
  puts "What is the name of the network you want to use"
  puts

  network_name = gets.chomp
  puts 

  puts "What is the password?"
  puts 

  network_password = gets.chomp
  puts

  text_to_encode = "WIFI:T:WPA;S:#{network_name};P:#{network_password};;"

elsif kind_of_code.include?("3")
  puts "What is the phone numer you want to send a text to?"
  puts

  phone_number = gets.chomp
  puts

  puts "What is the text you want to send?"
  puts
  
  text_message = get.chomp
  puts 

  text_to_encode = "SMSTO:#{phone_number}:#{text_message}"
else 
  puts "Selection is invalid. Please try again"
  exit
end 

puts "What would you like to name your PNG"
puts

filename = gets.chomp
puts

png = qrcode.as_png({ :size => 500 })

IO.binwrite("#{filename}.png", png.to_s)
