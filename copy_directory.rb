def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type stop"

  students = []
  @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]
  
  while true do
    name = gets.strip
    break if name == "stop"
    puts "Enter cohort"
    cohort = gets.strip.capitalize
    loop do
      if @months.include?(cohort)
        cohort == cohort.to_sym
        break
      else
        puts "We don't know this cohort, please check your spelling"
          @cohort = gets.strip.capitalize
          break
      end
    end
    puts "Enter hobbies"
    hobbies = gets.strip
    puts "Enter country of birth"
    country_of_birth = gets.strip
    puts "Enter height"
    height = gets.strip
    students << {name: name, cohort: cohort, hobbies: hobbies, country_of_birth: country_of_birth, height: height}
    "Overall, we have #{names.count} great students"
    sing = "Now we have #{students.count} student. Enter the next name or stop"
    plur = "Now we have #{students.count} students. Enter the next name or stop"
    if students.count < 2 
      puts sing 
    else
      puts plur
    end
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
  puts "--------------"
end


def print(students)
  students.
    map { |s| s[:cohort] }.
    uniq.
    each { |c| puts "#{c} cohort students are #{students.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')}" }
end


def print_footer(names)
  plur = "Overall, we have #{names.count} great students"
  sing = "Overall, we have #{names.count} great student"
  if names.count > 1
    puts plur
  else
    puts sing
  end
end

#nothing happens until we call the methods

students = input_students
print_header
print(students)
print_footer(students)