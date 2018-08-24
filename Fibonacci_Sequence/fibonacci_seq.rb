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
    @a = 0
    @b = 1
    @c = 0
  end

  def fibo_seq(end_num=15)
    end_loop = 0

    until end_loop == end_num
      print "#{@a}\t"

      @c = @a + @b
      @a = @b
      @b = @c

    end_loop += 1
    end
  end

  def a=(a)
    @a = a
  end

  def b=(b)
    @b = b
  end

  def c=(c)
    @c = c
  end

end

fibo = MyFibonacci.new

while true
  puts "\n1. Standard Fibonacci sequence"
  puts "2. To the Nth number sequence"
  puts "3. Start at ith number and end at nth number sequence"
  puts "4. Exit"

  print "You're choice: "
  choice = gets.chomp.to_i

  fibo = MyFibonacci.new

  case choice
  when 1
    fibo.fibo_seq

    print "\nPress enter to continue..."
    gets
    system 'cls' # clear content on Windows cmd
    system 'clear' # clear content on Terminal cmd

  when 2
    print "To the nth number: "
    nth = gets.chomp.to_i

    fibo.fibo_seq(nth)

    print "\nPress enter to continue..."
    gets
    system 'cls' # clear content on Windows cmd
    system 'clear' # clear content on Terminal cmd

  when 3
    print "Start at ith number: "
    ith = gets.chomp.to_i

    print "End at nth number: "
    nth = gets.chomp.to_i

    fibo.a = ith
    fibo.b = ith + 1
    fibo.c = 0

    fibo.fibo_seq(nth)

    print "\nPress enter to continue..."
    gets
    system 'cls' # clear content on Windows cmd
    system 'clear' # clear content on Terminal cmd

  when 4
    puts "GoodBye!!!"
    system 'cls' # clear content on Windows cmd
    system 'clear' # clear content on Terminal cmd
    break

  else
    puts "Invalid option, choose 1-5"

    print "\nPress enter to continue..."
    gets
    system 'cls' # clear content on Windows cmd
    system 'clear' # clear content on Terminal cmd
  end
end
