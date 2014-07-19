class Student
attr_accessor :name, :marks
def initialize(name,marks)
@name=name
@marks=marks
end
end

student=Student.new(gets,gets)
puts "Name: #{student.name}"
puts "Marks: #{student.marks}"
student=student.marks.to_i*0.2
puts "Percentage: #{student}"

