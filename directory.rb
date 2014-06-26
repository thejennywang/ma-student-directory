def print_header
	print "The students of my cohort at Makers Academy\n"
	print "-----------------\n"
end

def display(students)
	cohort = students.map { |student| student[:cohort] }.uniq 
	cohort.each do |month|
		puts "The students in the #{month.to_s} cohort are:" 
			students.each do |student|
				puts "#{student[:name]}, #{student[:age]}, #{student[:cohort]}" if student[:cohort] == month
			end
	end
end

def print_footer(names)
  if !names.empty? 
    puts "Overall, we have #{names.length} great student#{names.length > 1 ? "s" : ""}\n"
  else
    puts "No students in your cohort :("
  end
end

def input_students
	print "Please enter your name\n"
	#create an empty array
	students = []
	#get the first name
	name = gets.gsub("\n", "")
	# while the name is not empty, repeat this code
	while !name.empty? do
		print "Please enter your age\n"
		age = gets.gsub("\n", "")
		while ( age.to_i == 0 || age.to_i < 0 )
			puts "Please enter a numeric value for your age"
			age = gets.chomp
		end	

	print "Please enter a number between 1-12 for the month of your cohort (1-January, etc)\n"
	# cohortMonth = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
	cohort = gets.gsub("\n", "")
	# cohort = cohortMonth[cohort.to_i - 1]

	if cohort.empty?
		cohort = "6"
	end	

	cohort = (Time.new(Time.now.year, cohort.to_i).strftime "%B").to_sym

	puts "Your input is #{name}, #{age}, #{cohort}. Are you sure? (y/n)"
	confirmation = gets.gsub("\n", "")
	if confirmation == "y"

		#add the student hash to the array
		students << {:name => name, :age => age, :cohort => cohort}
		
		
		print "Now we have #{students.length} student#{students.length > 1 ? "s" : ""}\n" 
		
		#gets another name from the user
		print "Please enter another name OR press return for Menu\n"
		name = gets.gsub("\n", "")
	elsif confirmation == "n"
		puts "Please re-enter your name"
		name = gets.gsub("\n", "")
	end
end
	#return the array of students
	students
end

def interactive_menu
	students = []
	loop do
		# 1. print the menu and ask the user what to do
		puts "--------MENU---------"
		puts "1. Input the students"
		puts "2. Show the students"
		puts "9. Exit" # 9 because we'll be adding more items
		puts "---------------------"
		# 2. read the input and save it into a variable
		selection = gets.chomp
		# 3. do what the user has asked
		case selection
		  when "1"
			students = input_students
		  when "2"
			print_header
			display(students)
			print_footer(students)
		  when "9"
			exit # this will cause the program to terminate
		  else
			puts "I don't know what you meant, try again"
		end
	end
end

#nothing happens until we call the methods
interactive_menu