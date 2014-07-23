def swap
	no1=gets.to_i
	no2=gets.to_i

	no1=no1+no2
	no2=no1-no2
	no1=no1-no2

	puts "After Swap #{no1}"
	puts "After Swap #{no2}"

end
swap

