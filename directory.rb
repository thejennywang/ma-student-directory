
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
	puts "The students of my cohort at Makers Academy"
	puts "-----------------"
end

def print(students)
	students.each do |student|
		puts "#{student[:name]} (#{student[:cohort]} cohort)"
	end
end 

def print_footer(names)
	puts "Overall, we have #{names.length} great students"
end

def input_students
	puts "Please enter the names of the students"
	puts "To finish, just hit return twice"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		#add the studen hash to the array
		students << {:name => name, :cohort => "June 2014"}
		puts "Now we have #{students.length} students"
		#gets another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end

#nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)