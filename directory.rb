
#Lets put all of the students into an array
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

#nothing happens until we call the methods
print_header
print(students)
print_footer(students)