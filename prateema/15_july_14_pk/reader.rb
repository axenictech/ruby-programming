class Stud
	#getter setter classes
	attr_accessor:name , :age


def initialize(name,age)

	@name=name
	@age=age
	end
end

student=Stud.new(gets,gets)

puts "Name: #{student.name}"
puts "age: #{student.age}"
student=student.marks.to_i*34
puts "Percentage: #{student}"

