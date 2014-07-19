
# swap without third variable
def swap

	puts "\nEnter first No: "
	a=gets.to_i
	puts "Enter second No: "
	b=gets.to_i

	puts "\nBefore swaping"
	puts "first no. #{a}"
	puts "second no. #{b}"

		a= a+b
		b= a-b
		a= a-b

	puts "\nAfter swaping"
	puts "first no. #{a}"
	puts "second no. #{b}"
	
end

swap