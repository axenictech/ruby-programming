
class Student
	def data
		puts "Student"
	end
end

class Teacher 
	def data
		puts "Teacher"
	end
end

#create the object of Student 
data1=Student.new
data1.data
data1=Teacher.new
data1.data

puts "............"
data2=Student.new
data2=Teacher.new
data2.data
data2.data

puts "............"
data3=Teacher.new
data3=Student.new
data3.data
data3.data


