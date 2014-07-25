
class Case1			
	attr_reader :marks,:name

		print "Enter the name of student:"
		name=gets
		print "Enter the marks of student:"		
		marks=gets.to_i

		result=case marks
			when 0..30	
			puts " the result is poor","rating is *"
			when 31..50
			puts" the result is ok","rating is **"
			when 50..60
			puts"the result is good","rating is ***"
			when 61..80
			puts"the result is very good","rating is ****"
			when 81..100
			puts" the result isexcellent","rating is *****"
			
		end			
	puts result
end