class Student
attr_reader :id,:name
def initialize(id,name)
@id=id
@name=name
end
end
student=Student.new(100,"sudarshan")
puts "Id: #{student.id} Name: #{student.name}"
