def print_header
	puts "The students of my cohort at Makers Academy"
	puts "-----------------"
end

def display_students #Steve helped a lot
	@students.map { |student| student[:cohort] }.uniq.each do |month|
		puts "The students in the #{month} cohort are:" 
		@students.each { |student| puts student_info(student[:name], student[:age],student[:cohort]) if student[:cohort] == month}
	end
end

	def student_info(name, age, cohort) #steve
		 "#{name}, #{age}, #{cohort}"
	end

def print_footer
  if !@students.empty? 
  	show_student_amount("Overall, we have") 
  else
    puts "No students in your cohort :("
  end
end

def input_name
		puts "Please enter your name"
		# get the first name
		name = gets.chomp
end

def input_age
	puts "Please enter your age"
	age = gets.chomp
	until ( age.to_i > 0 )
		puts "Please enter a numeric value for your age"
		age = gets.chomp
	end
	age
end

def input_cohort
	puts "Please enter a number between 1-12 for the month of your cohort (1-January, etc)"
	# get cohort month, if nothing entered default to 6 (june)
	cohort = gets.chomp
	cohort = "6" if cohort.empty?

	cohort = (Time.new(Time.now.year, cohort.to_i).strftime "%B").to_sym
end

def show_student_amount(context) #steve
	puts "#{context} #{@students.length} student#{@students.length > 1 ? "s" : ""}" 
end

def check_input(name, age, cohort)
	puts "Your input is #{student_info(name, age, cohort)}. Are you sure? (y/n)"
	confirmation = gets.chomp
	
	if confirmation.downcase == "y"
		#add the student hash to the array
		@students << {:name => name, :age => age, :cohort => cohort}
		show_student_amount("Now we have")
	end
end

def input_students
	name = input_name
	while !name.empty? do
		age = input_age
		cohort = input_cohort
		check_input(name, age, cohort)
		puts "Please enter another name OR press return for Menu"
		name = gets.chomp
	end
	@students
end

def print_menu
		puts "\n--------MENU---------"
		puts "1. Input the students"
		puts "2. Show the students"
		puts "3. Save the list to students.csv"
		puts "4. Load the list from students.csv"
		puts "9. Exit" # 9 because we'll be adding more items
		puts "---------------------\n"
end

def show_students
	print_header
	display_students
	print_footer
end

def process(selection)
	case selection
		when "1"
			@students = input_students
		when "2"
			show_students
		when "3"
			save_students
		when "4"
			load_students
		when "9"
			exit # this will cause the program to terminate
	else
		puts "I don't know what you meant, try again"
	end
end

def save_students
	# open the file for writing
	file = File.open("students.csv", "w")
	# iterate over the array of students
	@students.each do |student|
		file.puts [student[:name], student[:age], student[:cohort]].join(",")
	end
	file.close
end

def load_students
	file = File.open("students.csv", "r")
	file.readlines.each do |line|
		name, age, cohort = line.chomp.split(',')
			@students << {:name => name, :age => age, :cohort => cohort.to_sym}
	end
	file.close
end

def interactive_menu
	@students = []
	loop do
		# 1. print the menu and ask the user what to do
		print_menu
		# 2. read the input and save it into a variable
		process(gets.chomp)

	end
end

#nothing happens until we call the methods
interactive_menu