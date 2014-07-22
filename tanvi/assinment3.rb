class Ashraf						# this is a class having one display method
	def display
		print "enter the name:"
		name=gets
		print "enter the marks:"		#This line takes the input name from user
		marks=gets.to_i
		case(marks)
			when 0..30	
			puts "poor","rating is 1"
			when 31..50
			puts" ok","rating is 2"
			when 50..60
			puts" good","rating is 3"
			when 61..80
			puts"  very good","rating is 4"
			when 81..100
			puts" excellent","rating is 5"
		end			
	end
end
Ashraf.new.display
#a=Ashraf.new.display
--------------------------------------------
output

rudra@ubuntu:~/ashraf$ ruby assinment1.rb
enter the name:asharf
enter the marks:56
 good
rating is 3
rudra@ubuntu:~/ashraf$ ruby assinment1.rb
enter the name:ashraf
enter the marks:23
poor
rating is 1
rudra@ubuntu:~/ashraf$ ruby assinment1.rb
enter the name:ashraf
enter the marks:88
 excellent
rating is 5
rudra@ubuntu:~/ashraf$ 

