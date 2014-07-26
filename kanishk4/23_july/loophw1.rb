class Loophw1
	attr_reader :name, :range
	def initialize(name,range)

		@name=name;
		@range=range;
	end
end
puts"enter the name of student"
name=gets
puts"enter the range of student"
range=gets.to_i
if range>0 and range<30
puts"#{name}"+"pass class"
elsif range>31 and range<50
puts"#{name}"+"second class"
elsif range>51 and range<60
puts"#{name}"+"higher second class"
elsif range>61 and range<80
puts"#{name}"+"first class"
else range>81 and range<100

puts"#{name}"+"first class with distinction"	
end