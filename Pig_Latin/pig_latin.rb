=begin
******************* Pig Latin *******************

A fun play with strings application.

The string entered by user is converted to pig latin. If it starts with vowel,
append "way" at the end. If it starts with consonant, the first character goes
to end and appends "ay" to it.

Example:
You typed -> "where are those mini cheddars"
Pig Latin Version ===> hereway areway hosetay inimay heddarscay
=end

class PigLatin

  def initialize(str)
    @pig_latin_str = str.split.map(&:to_s) # split the input to words arrays

    @vowels = ["a", "e", "i", "o", "u"] # initialize the array of vowels

    @pig_latin_final = Array.new # create the final array to hold pig latin string
  end

  # Setter method for input string
  def pig_latin_str=(str)
    @pig_latin_str = str.split.map(&:to_s) # split the input to words arrays
  end

  # Getter method for input array size
  def str_size
    return @pig_latin_str.size
  end

  def to_pig_latin
    @pig_latin_str.select do |word| # use each block to iterate through array word by word
      char_array = word.split(//) # split the word to characters array

      v1_str = word.downcase # lowercase the string
      v2_str = v1_str.gsub(" ","") # eliminte the space
      v3_str = v2_str.gsub(".","") # eliminte the dot
      first_char = v3_str[0]

      a_vowel = is_vowel?(first_char) # check if first_char is a vowel

      if (a_vowel) # If it starts with vowel
        pig_lat_word = word+"way" # adds "way" if it's a string starting with vowel

        @pig_latin_final.push(pig_lat_word) # push to final pig latin array
      else # Else if it starts with consonant
        new_word = word[1..word.size] # eliminate first letter from word by creating new var

        pig_lat_word = new_word+first_char+"ay" # create new var by adding new word var + first letter + "ay"

        @pig_latin_final.push(pig_lat_word) # push to final pig latin array
      end
    end


  end

  # Checks if passed argument is a vowel
  def is_vowel?(first_letter)
    is_vowel = false

    @vowels.size.times do |i| # loop through the vowel array
      char = @vowels[i]

      if (first_letter == char)
        is_vowel = true
        break
      else
        is_vowel = false
      end
    end

    return is_vowel
  end

  # Getter method for final pig latin word or phrase
  def pig_latin_final
    return @pig_latin_final
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

end

while true
  # Prompt input
  print "Please type a string: "
  user_string = gets.chomp.to_s

  puts "You typed -> \"#{user_string}\""

  # Create object
  pig_latin_obj = PigLatin.new(user_string)

  # Get size of array of input
  size = pig_latin_obj.str_size

  puts "Size -> #{size}"

  # Function call
  pig_latin_obj.to_pig_latin

  # Grab new string and pass it to new array
  pl_final = pig_latin_obj.pig_latin_final

  # Display new pig latin equivalent
  print "Pig Latin Version ===> "
  pl_final.each { |word| print "#{word} " }

  print "\nContinue? y/n: "
  continue = gets.chomp.to_s

  pig_latin_obj.clear_screen(0) # method for clearing terminal

  break if continue == "n"

end
