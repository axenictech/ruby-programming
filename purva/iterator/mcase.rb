do
puts "Enter the marks"
marks = gets.chomp.to_i
case marks
	when 80
		puts " u got distiction"
	when 60..75
		puts " u got first class"
	when 50..60
		puts "u got second class"
	when 35..50
		puts "u r pass"
	else
	   puts"sorry u r failed "
end
puts "Do you want to close press y"

opt = gets 
while !opt == "y"

	
end
