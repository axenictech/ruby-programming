class Var
	puts "the number of digit you want to enter"
	number=gets
	num=number.to_i
	num=num-1
	array=[]
		for i in 0..num
			array[i]=gets
		end
	p array
end