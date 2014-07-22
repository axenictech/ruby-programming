# this method takes two parameter
def display(name,marks)
	@name=name
	@marks=marks.to_i
	case(@marks)
			when 0..30 			# compare the marks value with (0,30)	
			puts "poor","rating is 1"
			when 31..50			# compare the marks value with (0,30)
			puts" ok","rating is 2"
			when 50..60			# compare the marks value with (0,30)	
			puts" good","rating is 3"
			when 61..80			# compare the marks value with (0,30)
			puts"  very good","rating is 4"
			when 81..100			# compare the marks value with (0,30)
			puts" excellent","rating is 5"
	end
end
# call display method with two parameter
display(gets,gets)					
--------------------------------
output
rudra@ubuntu:~/tanvi$ ruby assinment4.rb
tanvi
56
 good
rating is 3
rudra@ubuntu:~/tanvi$ 

