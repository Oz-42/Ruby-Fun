=begin
******************* Game Of Life *******************

A fun play with cellular automaton

* still a work in progress

Trying to implemement Conway's Game of Life with ruby via terminal

=end

class GameOfLife

  def initialize(row_size,col_size)
    place_holder_init(row_size, col_size)
  end

  # Create multi_array variable with value 0, everywhere
  def place_holder_init(row_s,col_s)
    @multi_array = Array.new(row_s) {Array.new(col_s,0)}
  end

  # Display the mulit-arry as grid
  def display_multi_array
    @multi_array.each {|cell| puts "#{cell}"}
  end

  # Insert points in to co-ordinates
  def insert_points(points,row_cap,col_cap)
    @points_array = Array.new(points) {Array.new(2,0)} # array of "points", and each value is another array of 2 each value of 0

    puts "Insert between: Row=>#{row_cap} Column=>#{col_cap}\n" # indicate to user where to insert points

    puts "Insert points where on the above grid?\n"

    for i in 0...points # for loop used to enter grid co-ordinates for points  
      for u in 0...2
        if u == 0
          print "Point #{i+1} row: " # input value at row for certain point
          @points_array[i][u] = gets.chomp.to_i # store input value for row into multi-D array
        else
          print "Point #{i+1} column: " # input value at column for certain point
          @points_array[i][u] = gets.chomp.to_i # store input value for column into multi-D array
        end
      end
    end

    @points_array.each {|e| puts "#{e}"}

    insert_at(points) # function call
    gets
  end

  # Insert values at specified co-ordinates
  def insert_at(points)
    for i in 0...points
      @multi_array[@points_array[i][0]][@points_array[i][1]] = 1 # insert 1 at specified position
    end
  end

  # Reset grid(multi_array) to value 0, everywhere
  def clear_grid(row_s,col_s)
    for i in 0...row_s
      for u in 0...col_s
        @multi_array[i][u] = 0
      end
    end

    puts "Grid cleared\n"
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
end # end of class GameOfLife

  puts "Welcome to CONWAY'S GAME OF LIFE" # still under construction!

  print "Input size of grid: "
  puts "\nExample: 10 10"
  row,col = gets.chomp.split.map(&:to_i)

  gol_obj = GameOfLife.new(row,col)

  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

loop do
  gol_obj.display_multi_array
  puts "1. Insert Point(s)"
  puts "2. Clear grid"
  puts "0. Quit"

  print "You're choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "\nHow many point: "
    points = gets.chomp.to_i

    gol_obj.insert_points(points,row,col) # function call

    gol_obj.clear_screen(choice) # method for clearing terminal

  when 2
    gol_obj.clear_grid(row,col) # function call

    gol_obj.clear_screen(choice) # method for clearing terminal

  when 0
    gol_obj.clear_screen(choice) # method for clearing terminal
    break

  else
    puts "Invalid option, choose 1-5"

    print "\nPress enter to continue..."
    gets
    system 'cls' # clear content on Windows cmd
    system 'clear' # clear content on Terminal cmd
  end

end
