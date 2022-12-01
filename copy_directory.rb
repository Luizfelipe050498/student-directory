def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type stop"

  students = []
  @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  
  while true do
    name = gets.chomp
    break if name == "stop"
    puts "Enter cohort"
    cohort = gets.chomp.capitalize
    loop do
      if @months.include?(cohort)
        cohort == cohort.to_sym
        break
      else
        puts "We don't know this cohort, please check your spelling"
          @cohort = gets.chomp.capitalize
          break
      end
    end
    puts "Enter hobbies"
    hobbies = gets.chomp
    puts "Enter country of birth"
    country_of_birth = gets.chomp
    puts "Enter height"
    height = gets.chomp
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
    puts "Now we have #{students.count} students. Enter the next name or stop"
  end
  students.each do |item|
    item.each do |key, value|
      value = "N/A"  
      if item[key] == ""
        item[key] = value
      end
    end
  end
  students
end


# and then print them
def print_header
  puts "Thes students of villains Academy"
  puts "------------------"
end


def print(students)
  students.
    map { |s| s[:cohort] }.
    uniq.
    each { |c| puts "#{c} cohort students are #{students.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')}" }
end


def print_footer(names)
  puts "Overall, we have #{names.count} great students"
end

#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)