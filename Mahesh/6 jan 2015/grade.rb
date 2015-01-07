def gradeIf()
	
	puts"::::::::::::::::::gradeIf:::::::::::::::::::::::::"
	puts"Enter your marks : "
	marks=gets.chomp.to_i
	if marks <= 100 && marks >= 91
	puts "Your grade is : Excellent"

		elsif marks <= 90 && marks  >= 81
		puts "Your grade is : Good"

			elsif marks <= 80 && marks >=51
			puts "Your grade is : Average"

				elsif marks <=  50 && marks  >=40
				puts "Your grade is : Need Improvement"
			
					else puts "Your grade is : Fail"
	end
end
# gradeIf(100)
# gradeIf(80)
# gradeIf(60)
# gradeIf(40)
# gradeIf(30)

# def gradeCase(marks)
# 	case marks
# 		when 100..90 then puts "Your grade is : Excellent" #(marks <= 100 && marks > 90)
#   		puts "Your grade is : Excellent"
#   		 when 90,80  #(marks <= 90 && marks > 80)
#   		 puts "Your grade is : Good"
#   		# when marks.between?80,50
#   		# puts "Your grade is : Average"
#   		# when marks.between?50,40
#   		# puts "Your grade is : Need Improvement"
#   		#else puts "Your grade is : Fail"
# 	end
# end
# gradeCase(100)
# gradeCase(80)
# gradeCase(60)
# gradeCase(40)
# gradeCase(30)
def gradeCase()
	
	puts"::::::::::::::::::gradeCase:::::::::::::::::::::::::"
	puts"Enter your marks : "
	marks=gets.chomp.to_i
    case marks
    when 0..40 then puts "Fail"
	when 41..50 then puts "Need Improvement"
	when 51..80 then puts "Average"
	when 81..90 then puts "Good"
	when 91..100 then puts "Excellent"
	else "Fail"
    end
end

# gradeCase(40)
# gradeCase(50)
# gradeCase(80)
# gradeCase(90)
# gradeCase(92)


def gradeWhile()

	puts"::::::::::::::::::gradeWhile:::::::::::::::::::::::::"
	puts"Enter your marks : "
	marks=gets.chomp.to_i
	
		while(marks >= 0 && marks <=40)
			puts "Fail"
			break;
		end
		while(marks >= 41 && marks <=50)
			puts "Need Improvement"
			break;
		end
		while(marks >= 51 && marks <=80)
			puts "Average"
			break;
		end
		while(marks >= 81 && marks <=90)
			puts "Good"
			break;
		end
		while(marks >=91 && marks <=100)
			puts "Excellent"
			break;
		end

		
	

end
# gradeWhile(40)
# gradeWhile(50)
# gradeWhile(80)
# gradeWhile(90)
# gradeWhile(92)

def gradeLoop()
	puts"::::::::::::::::::gradeLoop:::::::::::::::::::::::::"
	puts"Enter your marks : "
	marks=gets.chomp.to_i
		
		loop do
  				
  			 if (marks >= 0 && marks <= 40)
  			 	puts "Fail" 
  			 	break
  			 end
  			 break
		end
		loop do
  				
  			 if (marks >= 41 && marks <= 50)
  			 	puts "Need Improvement"
  			 	break
  			 end
  			  break
		end
		loop do
  				
  			 if (marks >= 51 && marks <= 80)
  			 	puts "Average" 
  			 	break
  			 end
  			  break
		end
		loop do
  				
  			 if (marks >= 81 && marks <= 90)
  			 	puts "Good"
  			 	break
  			 end
  			  break
		end
		loop do
  				
  			 if (marks >= 91 && marks <= 100)
  			 	puts "Excellent"
  			 	break
  			 end
  			  break
		end
		
	

end


# gradeLoop(40)
# gradeLoop(50)
# gradeLoop(80)
# gradeLoop(90)
# gradeLoop(92)

loop do
puts"\n\n::::::::::::::::::Enter Your option:::::::::::::::::::::::::"
puts ""
puts "0 : Exit"
puts "1 : gradeIf"
puts "2 : gradeCase"
puts "3 : gradeWhile"
puts "4 : gradeLoop"
puts"\n\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::"
puts ""
opt=gets.chomp

case  opt
when "0" then break
	when "1" then gradeIf
		when "2" then gradeCase
			when "3" then gradeWhile
				when "4" then gradeLoop

	

end
end