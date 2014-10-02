class WHILE
	def accept 
		begin
		puts "Enter no:"
		 $no=gets.to_i
	
		
		
			if $no %2 ==0
				puts "#{$no}Number is even"

			else
				puts "#{$no} number is odd"
			end
		    puts "Do you want to contine[y/n]??"
		    
		   @@n=gets.chomp
	    end until @@n=="n"
    end
end

WHILE.new.accept
