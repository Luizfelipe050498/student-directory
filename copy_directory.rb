def input_students
  puts "Please enter the names of the students"
  puts "To finish, just type stop"

  @students = []
  @months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"]

  while true do
    name = gets.strip

    while name == ""
      puts "Can't be blank"
      name = gets.strip
    end

    break if name == "stop"
    puts "Enter cohort"
    cohort = gets.strip.capitalize
      loop do
        if @months.include?(cohort) # => true
          cohort == cohort.to_sym
          break
        else
          puts "We don't know this cohort, please check your spelling"
          cohort = gets.strip.capitalize
          break
        end
      end
    puts "Enter hobbies"
    hobbies = gets.strip
    puts "Enter country of birth"
    country_of_birth = gets.strip
    puts "Enter height"
    height = gets.strip
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
  students.each do |student|
    puts "#{student[:name]}"
  end
end

def print_by_cohort(students)
  students.map { |stud| stud[:cohort] }.uniq.each { |c|
    puts "#{c} cohort students are #{students.find_all { |s| s[:cohort] == c }.map { |s| s[:name] }.join(', ')}" 
  }
end

def print_by_country(students)
  students.map { |stud| stud[:country_of_birth] }.uniq.each { |c|
    puts "#{c} country of birth students are #{students.find_all { |s| s[:country_of_birth] == c }.map { |s| s[:name] }.join(', ')}" 
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

def interactive_menu
  students = @students
  while true
    puts "What would you like to do?"
    puts "1. Show all students"
    puts "2. Show students by cohort"
    puts "3. Show students by country of birth"
    puts "Type stop to return"
    selection = gets.strip
    break if selection == "stop"
    if selection == "1"
      print_by_name(students)
    elsif selection == "2"
      print_by_cohort(students)
    elsif selection == "3"
      print_by_country(students)
    else
      puts "Invalid input"
    end
  end      
end

@students = input_students
print_header
interactive_menu
print_footer(@students)