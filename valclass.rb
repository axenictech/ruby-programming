
class Student
	
	def accept
	
	puts "Enter the name"	
	@name=gets
	

	puts "Enter the marks"
	@mark=gets.to_i 

	if(@mark.class.name=="string") then
	puts "digits only"
	
	else
	 puts ("marks #{@mark}")
	end
	
	end
	 
	
	
end



stud=Student.new
stud.accept
