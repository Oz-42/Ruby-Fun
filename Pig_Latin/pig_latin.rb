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
    @pig_latin_str = str.split.map(&:to_s)

    @vowels = ["a", "e", "i", "o", "u"]

    @pig_latin_final = Array.new
  end

  def pig_latin_str=(str)
    @pig_latin_str = str.split.map(&:to_s)
  end

  def str_size
    return @pig_latin_str.size
  end

  def to_pig_latin
    @pig_latin_str.select do |word|
      char_array = word.split(//)

      v1_str = word.downcase # lowercase the string
      v2_str = v1_str.gsub(" ","") # eliminte the space
      v3_str = v2_str.gsub(".","") # eliminte the dot
      first_char = v3_str[0]

      a_vowel = is_vowel?(first_char)

      if a_vowel
        pig_lat_word = word+"way"

        @pig_latin_final.push(pig_lat_word)
      else
        new_word = word[1..word.size]

        pig_lat_word = new_word+first_char+"ay"

        @pig_latin_final.push(pig_lat_word)
      end
    end


  end

  def is_vowel?(first_letter)
    is_vowel = false

    @vowels.size.times do |i|
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

  def pig_latin_final
    return @pig_latin_final
  end

end

while true

  print "Please type a string: "
  user_string = gets.chomp.to_s

  puts "You typed -> \"#{user_string}\""

  pig_latin_obj = PigLatin.new(user_string)

  size = pig_latin_obj.str_size

  puts "Size -> #{size}"

  pig_latin_obj.to_pig_latin

  pl_final = pig_latin_obj.pig_latin_final

  print "Pig Latin Version ===> "
  pl_final.each {|word| print "#{word} "}

  print "\nContinue? y/n: "
  continue = gets.chomp.to_s

  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

  break if continue == "n"

end
