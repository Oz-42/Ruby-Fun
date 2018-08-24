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

    init_morse_HashMap
  end

  def init_morse_HashMap

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

  def get_in_arr # testing purposes
    return @in_arr
  end

  def convert_to_morse
    @in_arr.each do |e|
      @morse_new_m.push(@morseNalpha[e])
    end
  end

  def get_morse_code()
    return @morse_new_m
  end

end

while true

  print "Please type a string: "
  user_input = gets.chomp.split("").map(&:to_s)

  morse_obj = MorseCode.new(user_input)

  morse_obj.convert_to_morse

  morse_code_arr = morse_obj.get_morse_code

  # puts "Morse String? ==> #{morse_code_arr}" # in array format

  print "Morse Code Equivalence ===> "
  morse_code_arr.each {|e| print "#{e} "} # no space between all characters

  print "\nContinue? y/n: "
  cont = gets.chomp.to_s

  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

  break if cont == "n"

end
