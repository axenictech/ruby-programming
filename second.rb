#prog using class n switch case
class Second
	def initialize(name,state)
		@name=name
		@state=state

		puts "the name is #{name}"
    
   i=state.to_i
   
   case i

   when 0..30 
   puts "pool"

    when 0..60 
    puts "good"
    when 0..90 
    puts "very good"
    
    when i<0
      puts "no is not in range"
  


    end
end
end

Second.new(gets,gets)
