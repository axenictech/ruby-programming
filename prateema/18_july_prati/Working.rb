class School

	#@name=gets
	#name=@name
	def  details
	puts "name of the school is #{$name}"
	end

	def student
	puts "enter student name"
		@studname=gets
	puts " my name is #{@studname}  and Name of my school is #{@name}"

	end
	
	def teachers
	puts "enter teachers name"
		@teachersname=gets
	puts "my name is #{@teachersname} and Name of school is #{@name}" 
	end


end


indi=School.new
def indi.marks(name)
		puts "Enter name of student"
		@name=gets
		name=@name
		puts "marks for english"
		@marks_of_maths=gets.to_i
		puts "marks for maths"
		@marks_of_english=gets.to_i
		puts "name marks in \n english is #{@marks_of_english}\n  maths is #{@marks_of_maths} "
end

indi.marks("name")






