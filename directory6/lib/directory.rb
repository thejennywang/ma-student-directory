def students
	@students ||= []
end

def create_student(name, cohort)
	student = {name: name, cohort: cohort}
end

def add(student)
	students << student
end

def print_student
	students.map do |student| 
		"#{student[:name]}, #{student[:cohort]}"
	end.join("\n")
end

def get_name
	gets.chomp
end

def students_to_csv(student)
	CSV.open('./students.csv', 'wb') do |bananacsv|
		bananacsv << student
	end 	
end

def load_students
	CSV.foreach('./students.csv', 'rb') do |line|
		students << line
	end
end