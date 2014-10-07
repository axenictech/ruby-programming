class SWITCH
	def accept
		puts "Enter Name:"
		@@name= gets
		puts "Enter Marks:"
		@@mark=gets.to_i

	end
	def print
		case @@mark
		when  0..40
			puts "#{@@name} is failed"
		when 40..60
			puts "#{@@name} got second class"
		when 60..80
			puts "#{@@name} got first class"
		
		end
	end
end
SWITCH.new.accept
SWITCH.new.print