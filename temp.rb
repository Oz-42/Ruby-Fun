=begin

Template ruby structure for basic program

=end

class Temp

end

while true

  puts "Ruby Template!\n"

  print "Please type a string: "
  user_input = gets.chomp

  puts "You typed -> \"#{user_input}\""

  print "Continue? y/n: "
  continue = gets.chomp.to_s

  break if continue == "n"

end
