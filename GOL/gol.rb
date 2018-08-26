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

  def place_holder_init(row_s,col_s)
    @multi_array = Array.new(row_s) {Array.new(col_s,0)}
  end

  def display_multi_array
    @multi_array.each {|cell| puts "#{cell}"}
  end

  def insert_points(points,row_cap,col_cap)
    @points_array = Array.new(points) {Array.new(2,0)}

    puts "Grid capacity is #{row_cap}x#{col_cap}\n"

    puts "Insert points where on the above grid?\n"

    for i in 0...points
      for u in 0...2
        print "row #{i} column #{u}: "
        @points_array[i][u] = gets.chomp.to_i
      end
    end

    @points_array.each {|e| puts "#{e}"}

    insert_at(points)
  end

  def insert_at(points)
    for i in 0...points
      @multi_array[@points_array[i][0]][@points_array[i][1]] = 1
    end
  end

  def clear_grid(row_s,col_s)
    for i in 0...row_s
      for u in 0...col_s
        @multi_array[i][u] = 0
      end
    end

    puts "Grid cleared\n"
  end

end

  puts "Welcome to CONWAY'S GAME OF LIFE"

  print "Input size of grid: "
  row,col = gets.chomp.split.map(&:to_i)

  gol_obj = GameOfLife.new(row,col)

  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

while true
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

  gol_obj.insert_points(points,row,col)

  print "\nPress enter to continue..."
  gets
  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

when 2
  gol_obj.clear_grid(row,col)

  print "\nPress enter to continue..."
  gets
  system 'cls' # clear content on Windows cmd
  system 'clear' # clear content on Terminal cmd

when 0
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
