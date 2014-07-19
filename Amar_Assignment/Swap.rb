#swap two variable withought using third variable
class Swap

	puts"Enter 1st no:"
	no1=gets.to_i  #get 1st no

	puts"Enter 2nd no:"
	no2=gets.to_i	#get 2nd no

	puts "before swappting"
	puts"a--->",no1
	puts"b--->",no2

	no1=no1*no2	#calculate and update the values for swaping
	no2=no1/no2
	no1=no1/no2

	puts "after swappting"
	puts"a--->",no1
	puts"b--->",no2
end