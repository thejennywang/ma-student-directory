
#Lets put all of the students into an array
students = [
	"Dave",
	"Eddie",
	"Catharina",
	"Igor",
	"Marco",
	"Lisa",
	"Michiel",
	"Jean",
	"Nicola",
	"Jenny",
	"Iona",
	"Nikesh",
	"Chloe",
	"Toan",
	"Jamie",
	"Peter",
	"Talal",
	"Charlie",
	"Charlotte",
	"Thomas",
	"Zoe",
	"Hannah",
	"Joe",
	"Alex",
	"Jeremy",
]

#first we're gonna print the students' names
puts "The students of my cohort at Makers Academy"
puts "-----------------"
students.each do |student|
	puts student
end

#finally, we print the total
print "Overall, we have #{students.length} great students"

