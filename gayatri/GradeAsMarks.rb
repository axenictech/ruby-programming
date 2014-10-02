class Grade

	def student
		puts "Enter the Student Name:"
		a=gets
		puts "Enter the Percentage:"
		b=gets

		if b.to_i>=66
			puts "Dist"
		elsif b.to_i>=60 and b.to_i<66 
			puts "First Class"
		elsif b.to_i>=55 and b.to_i<60
			puts "Higher Second Class"
		elsif b.to_i>=50 and b.to_i<55
			puts "Second Class"
		elsif b.to_i>=45 and b.to_i<50
			puts "Pass Class"
		elsif b.to_i<45
			puts "Fail"
		end
	end
end
var=Grade.new
var.student
			

