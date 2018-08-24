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
    @ini_str = str.split.map(&:to_s)

    @ini_str.each {|word| word.downcase!}

    @ini_vowels = ["a", "e", "i", "o", "u"]

    @mini_cheddar_final = Array.new
  end

  def ini_str=(str)
    @ini_str = str.split.map(&:to_s)

    @ini_str.each {|word| word.downcase!}
  end

  def to_mini_cheddar
    @ini_str.each do |str|
      str_char = str.split(//)
      cheddared_str = ""

      str_char.each do |char|

        @ini_vowels.size.times do |i|
          vowel_char = @ini_vowels[i]

          if (char == vowel_char)
            cheddared_str += char.upcase
            break
          end

          if (i == @ini_vowels.size - 1)
            cheddared_str = cheddared_str + char
          end
        end
      end

      @mini_cheddar_final.push(cheddared_str)
    end
  end

  def mini_cheddar_final
    return @mini_cheddar_final
  end

end

while true

  print "Please type a string: "
  user_input = gets.chomp.to_s

  small_cheddar = MiniCheddar.new(user_input)

  small_cheddar.to_mini_cheddar

  mini_cheddar_array = small_cheddar.mini_cheddar_final

  print "Mini Cheddar Version ===> "
  mini_cheddar_array.each {|word| print "#{word} "}

  print "\nContinue? y/n: "
  continue = gets.chomp.to_s

  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

  break if continue == "n"

end
