=begin
A basic school system program

using the warning flag - ruby -w my_program.rb
=end

class Student

  attr_accessor :name, :s_name, :age, :st_num

  def initialize(n=nil, s_n=nil, st_age=nil, st_n=nil)
    @name = n
    @s_name = s_n
    @age = st_age
    @st_num = st_n

    puts "Successfully created #{@name} #{@s_name}"
  end

  def save_to_file
    one_rec = "#{@name},#{@s_name},#{@age},#{@st_num}"

    if File.exist?("C:\\Users\\danny\\Desktop\\MyDocs\\Coding_Folder\\Text_Editors\\Ruby\\Fun\\School_System\\students.csv")
      puts "Opening File for appending!"
      student_file = File.new("students.csv", "a")
      student_file.puts(one_rec)
      student_file.close
      puts "#{@name} #{@s_name} Successfully Saved to System!"
    else
      puts "Creating new File!"
      student_file = File.new("students.csv", "w")
      student_file.puts(one_rec)
      student_file.close
      puts "#{@name} #{@s_name} Successfully Saved to System!"
    end
  end

  def read_all_students
    puts "NAME\t\tSURNAME\t\tAGE\t\tSTUDENT NUMBER\t\t"
    File.open("C:\\Users\\danny\\Desktop\\MyDocs\\Coding_Folder\\Text_Editors\\Ruby\\Fun\\School_System\\students.csv") do |record|
      record.each do |item|
        # Split each line into respective data columns
        @name,@s_name,@age,@st_num = item.chomp.split(",")

        puts "#{@name}\t\t#{@s_name}\t\t#{@age}\t\t#{@st_num}"
      end
  end

end

# class Grade
c = 0
puts "Welcome to SHADADO Academy"
while true

  puts c

  c += 1

  break if c == 10

end
