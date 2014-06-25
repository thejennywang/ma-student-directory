
#Lets put all of the students into an array
=begin
students = [
	{:name => "Dave Bayon", :cohort => :june},
	{:name => "Eddie Andress", :cohort => :june},
	{:name => "Catharina Luebke-Detring", :cohort => :june},
	{:name => "Igor Borowski", :cohort => :june},
	{:name => "Marco Araujo", :cohort => :june},
	{:name => "Lisa Altmann-Richer", :cohort => :june},
	{:name => "Michiel Stigter", :cohort => :june},
	{:name => "Jean Troiani", :cohort => :june},
	{:name => "Nicola Aitken", :cohort => :june},
	{:name => "Jenny Wang", :cohort => :june},
	{:name => "Iona Seligman", :cohort => :june},
	{:name => "Nikesh Ashar", :cohort => :june},
	{:name => "Chloe Donegan", :cohort => :june},
	{:name => "Toan Nguyen", :cohort => :june},
	{:name => "Jamie Allan", :cohort => :june},
	{:name => "Peter McCarthy", :cohort => :june},
	{:name => "Talal Khodr", :cohort => :june},
	{:name => "Charlie Redwood", :cohort => :june},
	{:name => "Charlotte Kelly", :cohort => :june},
	{:name => "Thomas Beeley", :cohort => :june},
	{:name => "Zoe Bryant", :cohort => :june},
	{:name => "Hannah Waxman", :cohort => :june},
	{:name => "Joe Dowdell", :cohort => :june},
	{:name => "Alex Z", :cohort => :june},
	{:name => "Jeremy Fox", :cohort => :june},
]
=end

def print_header
	print "The students of my cohort at Makers Academy\n".center(80)
	print "-----------------\n".center(80)
end

def display(students)
	i = 0
	while i < students.length
		print "#{students[i][:name]}, age #{students[i][:age]}, #{students[i][:cohort]}\n".center(80)
		i+=1
	end
end

def print_footer(names)
	print "Overall, we have #{names.length} great students\n".center(80)
end

def input_students
	print "Please enter your name\n"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		print "Please enter your age\n"
		age = gets.chomp
		while ( age.to_i == 0 || age.to_i < 0 )
			puts "Please enter a numeric value for your age"
			age = gets.chomp
		end	

	print "Please enter your cohort\n"
	cohort = gets.chomp

	if cohort.empty?
		cohort = "-"
	end	

	puts "Your input is #{name}, #{age}, #{cohort}, are you sure?"
	confirmation = gets.chomp
	if confirmation == "y"

		#add the student hash to the array
		students << {:name => name, :age => age, :cohort => cohort}
		print "Now we have #{students.length} students\n" 
		#gets another name from the user
		print "Please enter your name OR press return to exit\n"
		name = gets.chomp
	elsif confirmation == "n"
		puts "Please re-enter your name"
		name = gets.chomp
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