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
		print "Overall, we have #{names.length} great student#{names.length > 1 ? "s" : ""}\n" 
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
		print "Please enter your name OR press return to exit\n"
		name = gets.gsub("\n", "")
	elsif confirmation == "n"
		puts "Please re-enter your name"
		name = gets.gsub("\n", "")
	end
end
	#return the array of students
	students
end

#nothing happens until we call the methods
students = input_students
print_header
display(students)
print_footer(students)