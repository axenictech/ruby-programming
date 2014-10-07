class Grade

	def student
		puts "Check Student Grade :[y/n]"
		schk = gets.chomp
		if schk.eql?"y"
			
			puts "Enter the Student Name:"
			a=gets
			puts "Enter the Percentage:"
			mark=gets.to_i
			grade = case mark
		when 1..25
		'Fail'
		when 26..50
		'C'
		when 51..75
		'B'
		when 76..100
		'A'
		else
		'Out of range!'
		end
		puts grade

		else 
			puts "in exit"
		end

		
	end
end
g=Grade.new
g.student