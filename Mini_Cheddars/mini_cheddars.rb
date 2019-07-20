=begin
******************* whErE ArE thOsE mInI chEddArs *******************

A fun play with strings application.

The string entered by user is converted to mInI chEddArs.
Each vowel is converted to to Upper Case while consonants remain lowercase.

Example:
Please type a string: hello there stranger
Mini Cheddar Version ===> hEllO thErE strAngEr
=end

class MiniCheddar

  def initialize(str)
    @ini_str = str.split.map(&:to_s) # initialize array string of words split from user input

    @ini_str.each {|word| word.downcase!} # convert to lowercase

    @ini_vowels = ["a", "e", "i", "o", "u"] # initialize the array of vowels

    @mini_cheddar_final = Array.new # create array for final mini_cheddar string
  end

  def ini_str=(str)
    @ini_str = str.split.map(&:to_s)

    @ini_str.each {|word| word.downcase!}
  end

  def to_mini_cheddar
    @ini_str.each do |str| # use each block to split word into array of characters
      str_char = str.split(//) # split the word into characters/letters
      cheddared_str = ""

      str_char.each do |char| # go through each letter

        @ini_vowels.size.times do |i| # loop through the vowel size
          vowel_char = @ini_vowels[i]

          if (char == vowel_char) # checks if current letter matches current loop vowel character
            cheddared_str += char.upcase
            break # break immediatley from the loop cause char matched vowel character
          end

          if (i == @ini_vowels.size - 1)
            cheddared_str += char
          end
        end
      end

      @mini_cheddar_final.push(cheddared_str)
    end
  end

  # Getter method for final mini_cheddar string
  def mini_cheddar_final
    return @mini_cheddar_final # return final mini_cheddar string
  end

  # Clear the terminal
  def clear_screen(case_choice=nil)
    if case_choice != 0 && case_choice == nil
      print "\nPress enter to continue..."
      gets
      system 'cls' # clear content on Windows cmd
      system 'clear' # clear content on Terminal cmd
    else
      system 'cls' # clear content on Windows cmd
      system 'clear' # clear content on Terminal cmd
    end
  end

end # endo of class MiniCheddar

loop do
  # Prompt input
  print "Please type a string: "
  user_input = gets.chomp.to_s

  # Create new object
  small_cheddar = MiniCheddar.new(user_input)

  # Functtion call
  small_cheddar.to_mini_cheddar

  # Grab new string and pass it to new array
  mini_cheddar_array = small_cheddar.mini_cheddar_final

  # Display new mini_cheddar string
  print "Mini Cheddar Version ===> "
  mini_cheddar_array.each {|word| print "#{word} "}

  print "\nContinue? y/n: "
  continue = gets.chomp.to_s

  small_cheddar.clear_screen(0) # method for clearing terminal

  break if continue == "n"

end
