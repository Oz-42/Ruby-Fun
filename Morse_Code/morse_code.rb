=begin
******************* Morse Code *******************

A fun play with strings application.

The string entered by user is converted to morse code.
Each letter is converted to to morse code equivalence.

Example:
Please type a string: hello there
Morse Code Equivalence ===> .... . .-.. .-.. ---   - .... . .-. .
=end

class MorseCode

  def initialize(in_arr)
    # The initial arrays
    @in_arr = in_arr # the input array
    @morse_new_m = Array.new # the morse equivalent
    @morseNalpha = Hash.new # the hash map for alphabets to morse

    init_morse_HashMap # Function call to initialize the hash map
  end

  # initialize the hash map
  def init_morse_HashMap
    # key = alphabet, value = morse code
    @morseNalpha['a'] = ".-"
		@morseNalpha['b'] = "-..."
		@morseNalpha['c'] = "-.-."
		@morseNalpha['d'] = "-.."
		@morseNalpha['e'] = "."
		@morseNalpha['f'] = "..-."
		@morseNalpha['g'] = "--."
		@morseNalpha['h'] = "...."
		@morseNalpha['i'] = ".."
		@morseNalpha['j'] = ".---"
		@morseNalpha['k'] = "-.-"
		@morseNalpha['l'] = ".-.."
		@morseNalpha['m'] = "--"
		@morseNalpha['n'] = "-."
		@morseNalpha['o'] = "---"
		@morseNalpha['p'] = ".--."
		@morseNalpha['q'] = "--.-"
		@morseNalpha['r'] = ".-."
		@morseNalpha['s'] = "..."
		@morseNalpha['t'] = "-"
		@morseNalpha['u'] = "..-"
		@morseNalpha['v'] = "...-"
		@morseNalpha['w'] = ".--"
		@morseNalpha['x'] = "-..-"
		@morseNalpha['y'] = "-.--"
		@morseNalpha['z'] = "--.."
		@morseNalpha['.'] = ".-.-.-"
		@morseNalpha[','] = "--..--"
		@morseNalpha['?'] = "..--.."
		@morseNalpha['/'] = "-..-."
		@morseNalpha['@'] = ".--.-."
		@morseNalpha['1'] = ".----"
		@morseNalpha['2'] = "..---"
		@morseNalpha['3'] = "...--"
		@morseNalpha['4'] = "....-"
		@morseNalpha['5'] = "....."
		@morseNalpha['6'] = "-...."
		@morseNalpha['7'] = "--..."
		@morseNalpha['8'] = "---.."
		@morseNalpha['9'] = "----."
		@morseNalpha['0'] = "-----"
		@morseNalpha[' '] = " " # the key is space character with the space as equivalent morse code
		@morseNalpha[':'] = "---..."
		@morseNalpha['-'] = "-....-"
		@morseNalpha['('] = "-.--.-"
		@morseNalpha[')'] = "-.--.-"
		@morseNalpha['='] = "-...-"
  end

  def in_arr=(in_arr)
    @in_arr = in_arr
  end

  # Setter method for input string array
  def get_in_arr # testing purposes
    return @in_arr
  end

  # Converting to morse code method
  def convert_to_morse
    @in_arr.each do |e|
      @morse_new_m.push(@morseNalpha[e])
    end
  end

  # Getter method final morse code equivalent
  def get_morse_code()
    return @morse_new_m
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
  user_input = gets.chomp.split("").map(&:to_s) # split the input into character array

  # Create object
  morse_obj = MorseCode.new(user_input)

  # Function call
  morse_obj.convert_to_morse

  # Grab new string and pass it to new array
  morse_code_arr = morse_obj.get_morse_code

  # puts "Morse String? ==> #{morse_code_arr}" # in array format

  # Display new morse code equivalent
  print "Morse Code Equivalence ===> "
  morse_code_arr.each {|e| print "#{e} "} # no space between all characters

  print "\nContinue? y/n: "
  cont = gets.chomp.to_s

  morse_obj.clear_screen(0) # method for clearing terminal

  break if cont == "n"

end
