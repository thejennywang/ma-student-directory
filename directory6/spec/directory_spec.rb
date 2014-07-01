require 'directory'
require 'CSV'

describe 'Student Directory' do
	let (:student_one) {{name: 'one', cohort: 'cohort'}}
	let (:student_two) {{name: 'two', cohort: 'cohort'}}
	let (:student) {{name: 'name', cohort: 'cohort'}}

	it 'starts with no students' do
		expect(students).to be_empty
	end	

	it 'can create a student' do
		name = "Jenny"
		cohort = "June"
		student = {name: name, cohort: cohort}
		expect(create_student(name, cohort)).to eq student
	end

	it 'can add a student' do
		student = {name: 'name', cohort: 'cohort'}
		add(student)
		expect(students).to eq [student]
	end

	it 'can add two students' do
		add(student_one)
		add(student_two)
		expect(students).to eq [student_one, student_two]
	end

	it 'can print a student' do
		add(create_student("Jenny", "June"))
		expect(print_student).to eq "Jenny, June"
	end

	it 'can print two students' do
		add(student_one)
		add(student_two)
		expect(print_student).to eq "one, cohort\ntwo, cohort"
	end

	it 'asks for a name' do
		input = "Jenny"
		expect(self).to receive(:gets).and_return(input)
		expect(get_name).to eq "Jenny"
	end

	it 'knows if there is no name' do
		get_name = []
		expect(get_name).to be_empty
	end

	it 'saves students' do
		students = [student]
		bananacsv = double
		expect(bananacsv).to receive(:<<).with(student_one)
		expect(CSV).to receive(:open).with('./students.csv', 'wb').and_yield(bananacsv)
		students_to_csv(student_one)
	end

	it 'loads students' do
		expect(CSV).to receive(:foreach).with('./students.csv', 'rb').and_yield([students])
		load_students
	end

	context 'with multiple students' do
		before do
			students_in_cohort = [
				{:name => "Dave Bayon", :cohort => "June"},
				{:name => "Eddie Andress", :cohort => "June"},
				{:name => "Catharina Luebke-Detring", :cohort => "June"},
				{:name => "Igor Borowski", :cohort => "June"},
				{:name => "Marco Araujo", :cohort => "June"},
				{:name => "Lisa Altmann-Richer", :cohort => "June"},
				{:name => "Michiel Stigter", :cohort => "June"},
				{:name => "Jean Troiani", :cohort => "June"},
				{:name => "Nicola Aitken", :cohort => "June"},
				{:name => "Jenny Wang", :cohort => "June"},
				{:name => "Iona Seligman", :cohort => "June"},
				{:name => "Nikesh Ashar", :cohort => "June"},
				{:name => "Chloe Donegan", :cohort => "June"},
				{:name => "Toan Nguyen", :cohort => "June"},
				{:name => "Jamie Allan", :cohort => "June"},
				{:name => "Peter McCarthy", :cohort => "June"},
				{:name => "Talal Khodr", :cohort => "June"},
				{:name => "Charlie Redwood", :cohort => "June"},
				{:name => "Charlotte Kelly", :cohort => "June"},
				{:name => "Thomas Beeley", :cohort => "June"},
				{:name => "Zoe Bryant", :cohort => "June"},
				{:name => "Hannah Waxman", :cohort => "June"},
				{:name => "Joe Dowdell", :cohort => "June"},
				{:name => "Alex Z", :cohort => "June"},
				{:name => "Jeremy Fox", :cohort => "June"},
			]
			students_in_cohort.each do |student|
				add(student)
			end
		end

		it 'prints multiple students' do
			expect(print_student).to eq "Dave Bayon, June\nEddie Andress, June\nCatharina Luebke-Detring, June\nIgor Borowski, June\nMarco Araujo, June\nLisa Altmann-Richer, June\nMichiel Stigter, June\nJean Troiani, June\nNicola Aitken, June\nJenny Wang, June\nIona Seligman, June\nNikesh Ashar, June\nChloe Donegan, June\nToan Nguyen, June\nJamie Allan, June\nPeter McCarthy, June\nTalal Khodr, June\nCharlie Redwood, June\nCharlotte Kelly, June\nThomas Beeley, June\nZoe Bryant, June\nHannah Waxman, June\nJoe Dowdell, June\nAlex Z, June\nJeremy Fox, June"
		end
	end
end