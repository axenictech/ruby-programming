puts "Enter the marks"
marks = gets.chomp.to_i
if marks >= 75
	puts "u got distintion"
elsif marks < 75 && marks >= 60
	puts " u got first class"
elsif marks < 60 && marks >= 50
	puts "u got second class"
elsif marks < 50 && marks >= 35
	puts " u got pass class"
else
	puts " sorry u r failed"
end
	
