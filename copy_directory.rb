@students = []

def interactive_menu
  students = @students
  while true
    puts "What would you like to do?"
    puts "1. Add new students"
    puts "2. Show all students"
    puts "3. Show students by cohort"
    puts "4. Show students by country of birth"
    puts "5. Save the data to a csv file"
    puts "6. Load the list from students.csv"
    puts "Type stop to return"
    selection = STDIN.gets.chomp
    
    case selection
    when "1"
      input_students
    when "2"
      print_by_name(students)
    when "3"
      print_by_cohort(students)
    when "4"
      print_by_country(students)
    when "5"
      save_students
    when "6"
      load_students
    when "stop"
      break
    else
      puts "invalid input"
    end
  end      
end

def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type stop"
  @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  while true do
    name = STDIN.gets.chomp

    while name == ""
      puts "Can't be blank"
      name = STDIN.gets.chomp
    end

    break if name == "stop"
    puts "Enter cohort"
    cohort = STDIN.gets.chomp.capitalize
      loop do
        if @months.include?(cohort) # => true
          cohort == cohort.to_sym
          break
        else
          puts "We don't know this cohort, please check your spelling"
          cohort = STDIN.gets.chomp.capitalize
          break
        end
      end
    puts "Enter hobbies"
    hobbies = STDIN.gets.chomp
    puts "Enter country of birth"
    country_of_birth = STDIN.gets.chomp
    puts "Enter height"
    height = STDIN.gets.chomp
    @students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
    sing = "Now we have #{@students.count} student. Enter the next name or stop"
    plur = "Now we have #{@students.count} students. Enter the next name or stop"
    if @students.count < 2
      puts sing 
    else
      puts plur
    end
  end

  @students.each do |item|
    item.each do |key, value|
      value = "N/A"  
      if item[key] == ""
        item[key] = value
      end
    end
  end
  @students
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end 

def print_by_name(students)
  @students.each do |student|
    puts "#{student[:name]}"
  end
end

def print_by_cohort(students)
  @students.map { |stud| stud[:cohort] }.uniq.each { |c|
    puts "#{c} cohort students are #{@students.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')}" 
  }
end

def print_by_country(students)
  @students.map { |stud| stud[:country_of_birth] }.uniq.each { |c|
    puts "#{c} is the country of birth of: #{@students.find_all { |s| s[:country_of_birth] == c }.map { |s| s[:name] }.join(', ')}" 
  }
end

def print_footer(students)
  sing_end = "Overall, we have #{students.count} great student"
  plur_end = "Overall, we have #{students.count} great students"
  if students.count < 2
    puts sing_end
  else
    puts plur_end
  end
end

def save_students
  file = File.open("students.csv", "w")

  @students.each do |student|
    student_data = [student[:name], student[:cohort], student[:hobbies], student[:country_of_birth], student[:height]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students(filename = "students.csv")
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
  name, cohort, hobbies, country_of_birth, height = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu