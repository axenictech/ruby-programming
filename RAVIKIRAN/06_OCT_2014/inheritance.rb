module Student
	def sshow
		puts "Student id is : 101"
		puts "Student name is : Ravikiran"
	end
end

module Teacher
	def tshow
		puts "Teacher id is : 202"
		puts "Teacher name is : Rajendra"
	end
end

class School 
	include Student
	include Teacher
	def sch
		puts "SHRAMIK VIDYALAYA"
	end
end

sobj=School.new
sobj.sshow
sobj.tshow
sobj.sch

