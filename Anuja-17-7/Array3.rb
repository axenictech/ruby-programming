def arr
	array=Array.new
	

	puts "Enter number:  "
	no=gets.to_i

	no.times do 
		s=gets.chomp.to_i
		p array.push s
end
        sum=0
        
        array.each do |i|
		sum += i
	
		end

	puts sum
	 
end

	 arr