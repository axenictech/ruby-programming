class Marksheet
	def initialize (total, per)	
		puts 'enter the roll no'
		rno= 'gets'
		puts 'Enter the name'
		name=gets
		puts 'enter the m1'
		m1=gets
		puts 'enter the m2'
		m2=gets
		puts  'enter the m3' 
		m3=gets
		total=total
		per = per
		total=m1+m2+m3
		per=total/3
		puts "total is: #{total}"
		puts "percentage is: #{per}"
	end
end		
#m=Marksheet.new
#puts m
		


		
		
		

		