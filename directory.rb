
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
	print "The students of my cohort at Makers Academy\n"
	print "-----------------\n"
end

def display(students)
	students.each do |student|
		print "#{student[:name]} (#{student[:cohort]} cohort)\n"
	end
end 

def print_footer(names)
	print "Overall, we have #{names.length} great students\n"
end

def input_students
	print "Please enter the names of the students\n"
	print "To finish, just hit return twice\n"
	#create an empty array
	students = []
	#get the first name
	name = gets.chomp
	# while the name is not empty, repeat this code
	while !name.empty? do
		#add the studen hash to the array
		students << {:name => name, :cohort => "June 2014"}
		print "Now we have #{students.length} students\n"
		#gets another name from the user
		name = gets.chomp
	end
	#return the array of students
	students
end

#nothing happens until we call the methods
students = input_students
print_header
display(students)
print_footer(students)