def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type stop"

  students = []

  while true do
    name = gets.chomp
    break if name == "stop"
    puts "Enter cohort"
    cohort = gets.chomp
    puts "Enter hobbies"
    hobbies = gets.chomp
    puts "Enter country of birth"
    country_of_birth = gets.chomp
    puts "Enter height"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
    puts "Now we have #{students.count} students. Enter the next name or stop"
  end
  students
end


# and then print them
def print_header
  puts "Thes students of villains Academy"
  puts "------------------"
end

def print(students)
  while true do
    students.each_with_index do |student, index|
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort), #{student[:hobbies]}, #{student[:country_of_birth]}, #{student[:height]}".center(478)
    end
    break
  end
end

def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)