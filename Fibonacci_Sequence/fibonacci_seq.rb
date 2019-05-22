=begin
******************* Fibonacci Sequence *******************

A fun play with numbers application.

The famous Fibonacci numbers sequence is a summation of previous two numbers
to get the next number

Example:
0       1       1       2       3       5       8       13      21      34      55
89      144     233     377
=end

class MyFibonacci
  attr_accessor :a, :b, :c

  def initialize
    @a = 0 # the starting digit
    @b = 1 # the starting addition digit
    @c = 0 # the sum of @a and @b
  end

  def fibo_seq(end_num=15) # end_num decides how long loop will run, thus how many digits gets printed to screen
    start_loop = 0 # the starting position of loop

    until start_loop == end_num # the until loop method, continue until end_num is reached
      print "#{@a}\t" # display the fibonacci sequence at every loop

      @c = @a + @b # do the sum
      @a = @b # store value of @b to @a as it is the next value in sequence
      @b = @c # store value of @c to @b as the sum is the next number to add to @a

    start_loop += 1 # increase counter at end of every loop
    end
  end

  # This method will help decide at what ith number to start at
  def a=(a)
    @a = a # set value of @a using setter
  end

  # This method will help decide at what nth number to end at
  def b=(b)
    @b = b # set value of @b using setter
  end

  def c=(c)
    @c = c # set value of @c using setter
  end

  # Clear the terminal
  def clear_screen(case_choice=nil)
    if case_choice != 0 && case_choice == nil
      print "\nPress enter to continue..."
      gets.chomp
      system 'cls' # clear content on Windows cmd
      system 'clear' # clear content on Terminal cmd
    else
      system 'cls' # clear content on Windows cmd
      system 'clear' # clear content on Terminal cmd
    end
  end
end

fibo = MyFibonacci.new

loop do
  # The menu option
  puts "\n1. Standard Fibonacci sequence"
  puts "2. To the Nth number sequence"
  puts "3. Start at ith number and end at nth number sequence"
  puts "0. Exit"

  print "You're choice: "
  choice = gets.chomp.to_i

  fibo = MyFibonacci.new # the new object created

  case choice
  when 1
    # Functtion call
    fibo.fibo_seq # call the fibo_seq method using standard/default/initialized values

    fibo.clear_screen() # method for clearing terminal

  when 2
    # Ask user how many digits to print to screen
    print "To the nth number: "
    nth = gets.chomp.to_i

    # Functtion call
    fibo.fibo_seq(nth) # add argument to tell loop when to end

    fibo.clear_screen() # method for clearing terminal

  when 3
    # Ask user what number to start at
    print "Start at ith number: "
    ith = gets.chomp.to_i

    # Ask user how many digits to print to screen
    print "End at nth number: "
    nth = gets.chomp.to_i

    # Use the setters method
    fibo.a = ith # print and start sequence from this number
    fibo.b = ith + 1 # add 1 to start sequence number for addition
    fibo.c = 0

    fibo.fibo_seq(nth) # add argument to tell loop when to end

    fibo.clear_screen() # method for clearing terminal

  when 0 #
    fibo.clear_screen(choice) # method for clearing terminal
    break # end the program if 4 is typed

  else
    puts "Invalid option, choose 1-5"

    fibo.clear_screen() # method for clearing terminal
  end
end
