class Marksheet

	def accept

		puts("Enter Subject:")
		@@sub=gets
		puts("Enter Marks:")
		@@mark=gets.to_i

	end

	def disp

	if @@mark<=30 
			puts("Name: #{@@sub} Rating: poor....")
		elsif @@mark<=50 && @@mark>30
			puts("Name: #{@@sub} Rating: ok....")	
		elsif @@mark<=60 && @@mark>50
			puts("Name: #{@@sub} Rating: good....")	
		elsif @@mark<=80 && @@mark>60
			puts("Name: #{@@sub} Rating: Very Good....")
		else
			puts("Name: #{@@sub} Rating: Excellent....")	
		end 	

	end

end

Marksheet.accept.new
Marksheet.disp.new