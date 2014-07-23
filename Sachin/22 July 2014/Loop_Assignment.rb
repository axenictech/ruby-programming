class LoopAssign
	attr_reader :name, :range,

	def initialize(name, range)
		@name=name
		@range=range		
	end

	puts "Enter the name :"
	name=gets 
	puts "Enter the percentage :"
	range=gets.to_i

	if range > 0 and range < 40
	
		puts "#{name}"+" have got pass class"

	elsif range > 45 and range < 60
		puts "#{name}"+" have got second class"6

	elsif range > 60 and range < 75
		puts "#{name}"+" have got first class"
	
	else range > 75 and range < 100
		puts "#{name}"+"have got distinction"
	end

end