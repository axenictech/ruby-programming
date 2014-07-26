def swap

	puts "\nEnter the first digit: "
	k=gets.to_i
	puts "Enter the second digit No: "
	p=gets.to_i
	puts "\n these is Before swaping"
	puts "first no. #{k}"
	puts "second no. #{p}"

		k= k+p
		p= k-p
		k= k-p

	puts "\n these is After swaping"
	puts "first no. #{k}"
	puts "second no. #{p}"
	
end
swap