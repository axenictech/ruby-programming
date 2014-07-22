# takes input from user
def display
	print "enter the name:" 		#This line takes the input name from user
	name=gets
	print "enter the marks:" 		#This line takes the input marks from user
	marks=gets.to_i	
	if(marks<=30)				# check the condition for marks<=30
	puts "poor","rating is 1"
	end
	if(marks>30 && marks<=50)		# check the condition for marks<30,50>
		puts" ok","rating is 2"
	end
	if(marks>50 && marks<=60)		# check the condition for marks<50,60>
		puts" good","rating is 3"
	end		
	if(marks>60 && marks<=80)		# check the condition for marks<60,80>
		puts"  very good","rating is 4"
	end
	if(marks>80 && marks<=100)		# check the condition for marks<80,100>
		puts" excellent","rating is 5"
	end	
end
# call the display method
display 								
-------------------------------------------------
output

rudra@ubuntu:~/tanvi$ ruby assinment1.rb
enter the name:tanvi
enter the marks:12
 good
rating is 3
rudra@ubuntu:~/tanvi$ ruby assinment1.rb
enter the condition
poor
rating is 1
rudra@ubuntu:~/tanvi$ ruby assinment1.rb
enter the name:ashraf
enter the marks:88
 excellent
rating is 5
rudra@ubuntu:~/tanvi$ 

