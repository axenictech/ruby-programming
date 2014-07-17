
# program for dispaying rating by accepting name & rating
class Assignment 

	def accept #accept method for accepting name & Rating
		
		puts("Enter Name:")
		@@name=gets
		puts(" Enter Rating:")
		@@rat=gets.to_i

	end

	def disp #disp method that calculate the rating and display the result
		
		if @@rat<=30 
			puts("Name: #{@@name} Rating: poor....")
		elsif @@rat<=50 && @@rat>30
			puts("Name: #{@@name} Rating: ok....")	
		elsif @@rat<=60 && @@rat>50
			puts("Name: #{@@name} Rating: good....")	
		elsif @@rat<=80 && @@rat>60
			puts("Name: #{@@name} Rating: Very Good....")
		else
			puts("Name: #{@@name} Rating: Excellent....")	
		end
	end

end

	Assignment.new.accept #creating object of Assignment class and call accept method
	Assignment.new.disp   #creating object of Assignment class and call disp method
