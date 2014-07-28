class LoopAssign2
	attr_reader :score,:name

	puts "Enter the name :"
	name=gets 
	puts "Enter the socre of Student"
	score=gets.to_i


	result = case score
   	when 0..40 then "#{name} is Fail"
   	when 41..60 then "#{name} got Pass class"
   	when 61..70 then "#{name} got Pass with Merit "
   	when 71..100 then "#{name} got Pass with Distinction"
   	else "Invalid Score"
	end

puts result

end