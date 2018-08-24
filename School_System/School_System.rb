=begin
A basic school system program

using the warning flag - ruby -w my_program.rb
=end

class Student

  attr_accessor :name, :s_name, :age, :st_num

 # Used to initialize system
  def initialize(n=nil, s_n=nil, st_age=nil, st_n=nil)
    @name = n
    @s_name = s_n
    @age = st_age
    @st_num = st_n

    if (!(n.nil? && s_n.nil? && st_age.nil? && st_n.nil?))
      puts "Successfully created #{@name} #{@s_name}" # only if creating student record
    end
  end

# Save current initialized data to system
  def save_to_file
    one_rec = "#{@name},#{@s_name},#{@age},#{@st_num}" # store everything in one variable with comma separated delimeters

    if File.exist?("/home/dcn/Documents/Coding/Text_Editors/Ruby/Fun/School_System/students.csv")
      puts "Opening File for appending!"
      student_file = File.new("students.csv", "a") # append to already existing file with second argument "a"
      student_file.puts(one_rec) # write to file
      student_file.close
      puts "#{@name} #{@s_name} Successfully Saved to System!"
    else
      puts "Creating new File!"
      student_file = File.new("students.csv", "w") # create new file and write to it
      student_file.puts(one_rec) # write to file
      student_file.close
      puts "#{@name} #{@s_name} Successfully Saved to System!"
    end
  end

# Read all students and display
  def read_all_students
    puts "NAME\t\tSURNAME\t\tAGE\t\tSTUDENT NUMBER\t\t" # formatting purposes to the console
    puts "--------------------------------------------------------------"
    # change the file path depending on "students.csv" file location
    file_exist = File.exist?("/home/dcn/Documents/Coding/Text_Editors/Ruby/Fun/School_System/students.csv") # check if file exits

    if !file_exist
      puts "No file available to read or does not exist!" # alert if no such file
    else
      # If exist, open and start splitting the data accordingly
      # change the file path depending on "students.csv" file location
      File.open("/home/dcn/Documents/Coding/Text_Editors/Ruby/Fun/School_System/students.csv") do |record|
        record.each do |item| # use each block to display all within record array
          # Split each line into respective data columns
          @name,@s_name,@age,@st_num = item.chomp.split(",")

          puts "#{@name}\t\t#{@s_name}\t\t#{@age}\t\t#{@st_num}"
        end # end the item loop block
      end # end the record loop block
      puts "--------------------------------------------------------------"
    end # end the if..else loop block
  end # end the method definition

  def search_student(search_name)
    # change the file path depending on "students.csv" file location
    file_exist = File.exist?("/home/dcn/Documents/Coding/Text_Editors/Ruby/Fun/School_System/students.csv")

    if !file_exist
      puts "No file available to read or does not exist!"
    else
      puts "Searching"
      puts "NAME\t\tSURNAME\t\tAGE\t\tSTUDENT NUMBER\t\t"
      puts "--------------------------------------------------------------"
      # change the file path depending on "students.csv" file location
      File.open("/home/dcn/Documents/Coding/Text_Editors/Ruby/Fun/School_System/students.csv") do |record|
        record.select do |item|
          # Split each line into respective data columns
          @name,@s_name,@age,@st_num = item.chomp.split(",")
          if @name.include?search_name
            puts "#{@name}\t\t#{@s_name}\t\t#{@age}\t\t#{@st_num}" # display if record exist matching first name
          else
            # no record of specific name
          end
        end # end the item loop block
      end # end the record loop block
      puts "--------------------------------------------------------------"
    end # end the if..else loop block
  end # end the method definition

end

puts "Welcome to SHADADO Academy"
while true

  system "cls" # clear the screen
  puts "1. Create new student"
  puts "2. Display student information"
  puts "3. Search student"
  puts "0. Exit"

  print "Your choice: "
  choice  = gets.chomp.to_i

case choice

when 1
   puts "\n*** Creating new student record ***\n"

   print "\nName: "
   st_name = gets.chomp.to_s

   print "\nSurname: "
   st_surname = gets.chomp.to_s

   print "\nAge: "
   st_age = gets.chomp.to_s

   print "\nStudent number: "
   st_number = gets.chomp.to_s

   new_student_obj = Student.new(st_name,st_surname,st_age,st_number)

   print "Save to system(y/n): "
   save_student = gets.chomp.to_s

   if (save_student == "y")
     new_student_obj.save_to_file
   else
     puts "Discarding information!"
   end
   print "Press any key to return to menu..."
   gets.chomp
   system "cls" # clear the screen, windows statement
   system "clear" # clear the screen

when 2
  puts "\n*** Displaying student information  ***\n"
  display_st_info_obj = Student.new()
  display_st_info_obj.read_all_students
  print "Press any key to return to menu..."
  gets.chomp
  system "cls" # clear the screen, windows statement
  system "clear" # clear the screen

when 3
  puts "\n*** Search student system ***\n"
  search_st_obj = Student.new()

  print "Search by name: "
  name = gets.chomp.to_s

  name.capitalize!

  search_st_obj.search_student(name)
  print "Press any key to return to menu..."
  gets.chomp
  system "cls" # clear the screen, windows statement
  system "clear" # clear the screen

when 0
  puts "\nProgram stopping..."
  system "cls" # clear the screen, windows statement
  system "clear" # clear the screen

  break if (choice == 0)

else
  puts "\nInvalid option"
  system "cls" # clear the screen, windows statement
  system "clear" # clear the screen
end

end
