=begin
******************* Check if Palindrome *******************

A fun play with strings application.

The string entered by user is checked to see if it's a palindrome. A palindrome
is a word that spells the same forwards as it spells backwrds.

Example:
You typed -> "hannah"
"hannah" is a Palindrome
-------------------------------------------
You typed -> "hello"
"hello" is NOT a Palindrome
=end

class Palindrome

  def initialize(str)
    @pali_str = str

    @symbols = [" ",".",",","-",";",":","!","?"]
  end

  def pali_str=(str)
    @pali_str = str
  end

  def is_palindrome?
    v1_str = @pali_str.downcase # lowercase the string

    @symbols.each do |sym|
      v1_str.gsub!(sym,"") # eliminte all the symbols
    end

    if (v1_str == v1_str.reverse)
      puts "\"#{@pali_str}\" is a Palindrome"
    else
      puts "\"#{@pali_str}\" is NOT a Palindrome"
    end
  end

end

while true

  print "Please type a string: "
  user_string = gets.chomp.to_s

  puts "You typed -> \"#{user_string}\""

  pali = Palindrome.new(user_string)

  pali.is_palindrome?

  print "Continue? y/n: "
  continue = gets.chomp.to_s

  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

  break if continue == "n"

end
