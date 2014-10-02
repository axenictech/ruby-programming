class Iter
	def each
		ary = [1,2,3,4,5]
		ary.each do |i|
		puts i
	end
end

begin 
	puts "1. Each"
	puts "2. Collect"
	puts "3. Exit"
	puts "Enter your choice : "
	ch=gets.to_i
	
	case ch

	when 1
		Iter.new.each()

	when 2
		a = [1,2,3,4,5]
		b = a.collect{|x| 10*x}
		puts b

	when 3
	 	break
	else
		puts"You Enterd wrong choice..."
	end	 	

	print("Do you Want to Continue[Y/N] : ")
	@option=gets		
														
	end while(@option=~/^[y]+$/)
end