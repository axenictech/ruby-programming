
class Student
	def accept
	
	puts "\n Enter the name"	
	@name=gets
	
	puts "\n Enter the marks"
	@mark=gets.to_i
	if(@mark.class.name=="string") then #validation using class
	puts "digits only"
	
	else
	 puts ("Enter marks #{@mark}")
	end


	case @mark
		when 0..30
		puts("Name : #{@name} has #{@mark} is poor")
		
		when 31..50
		puts("Name : #{@name} has #{@mark} is ok")

  		when 51..60
		puts("Name : #{@name} has #{@mark} is good")
		
		when 61..80
		puts("Name : #{@name} has #{@mark} is very good")

		when 81..100
		puts("Name : #{@name} has #{@mark} is excellent")
	end
	end
	


end
stud=Student.new
stud.accept



