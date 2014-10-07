# swap without temp

class Swap
	def print

	    puts "Enter A:"
	    @a=gets.to_i
	    puts "Enter B:"
	    @b=gets.to_i
         puts "Before swapping A:#{@a},B:#{@b}"
	    @a=@a+@b
	    @b=@a-@b
	    @a=@a-@b

	    puts "After swapping A:#{@a},B:#{@b}"
		
	end
end
Swap.new.print	