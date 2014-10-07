class Relation
	def print
        puts "Enter Age:" 
		age = gets.to_i

		adult = age >= 18 ? true : false

		if adult then
		    puts "Adult"
		else
		    puts "Not adult"
		end
	end
end
Relation.new.print