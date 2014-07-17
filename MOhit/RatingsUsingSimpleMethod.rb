
class RatingsUsingSimpleMethod
	# initialize method to initialize the variables name and rating	
	def initialize(name,rating)
		@name , @rating = name, rating
		puts "The name is #{name}"
		i=rating.to_i
		if i<=30
			puts "The Rating for the #{name} is Poor"
		elsif i>31 and i<=50 
			puts "The Rating for the #{name} is OK"
		elsif i>51 and i<=60 
			puts "The Rating for the #{name} is Good"
		elsif i>61 and i<=80 
			puts "The Rating for the #{name} is Very Good"
		elsif i>81 and i<=100 
			puts "The Rating for the #{name} is Excelent"
			else
			puts "Please type ratings between 1 To 100 "				
		end		
	end
end
RatingsUsingSimpleMethod.new(gets,gets)
