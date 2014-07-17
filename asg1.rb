
class Student
	def accept
	
	puts "Enter the name"	
	@name=gets
	
	puts "Enter the marks"
	@mark=gets.to_i
	
	if (@mark==0 || @marks=~ /^[-a-z]+$/) then
	puts("non negative and non zero value  only")
	puts("sorry digits only")	
	
	end


	if @mark<=30 then
	puts("Name : #{@name} has #{@mark} is poor")
	
	elsif @mark<=50 then
	puts ("Name : #{@name} has #{@mark} is ok")

	elsif @mark<=60 then
	puts ("Name : #{@name} has #{@mark} is good")
	
	elsif @mark<=80 then
	puts ("Name : #{@name} has #{@mark} is very good")

	else
	puts ("Name : #{@name} has #{@mark} is excellent")
	
	end
end
end
stud=Student.new
stud.accept
