class Loop
	attr_reader :x
	def initialize(x)
		@x=x
	end

		puts "enter the value of x"
		x=gets.to_i

	if x>2
 		puts "x is greater than 2"
	elsif x==2 and x==0
  		puts "x is 1"
    else
        puts "I can't guess the no"
    end
end

 