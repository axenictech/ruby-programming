/swap two variable withought using Temp variable/

class Swap

	puts "Enter first No. : "
	no1=gets.to_i

	puts "Enter second No. : "
	no2=gets.to_i
	
	puts "Before Swapping..."
	puts "a = #{no1}"
	puts "b = #{no2}"

	no1 = no1+no2
	no2 = no1-no2
	no1 = no1-no2

	puts "After Swapping..."
	puts "a = #{no1}"
	puts "b = #{no2}"
end