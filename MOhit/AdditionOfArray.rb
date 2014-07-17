class Addition
	a=[1,3,6,7,4]
	sum = 0
	a.each { |a| sum+=a }
	p sum
end


=begin
puts "The Number of Inputs are #{ARGV.length}"
	sum=0
	if ARGV.length==0
		puts "The Addition is Zero"
	else
		ARGV.each do|a|
  			c+=a.to_i
		end
	end
	puts sum
end

ARGV.each do|a|
  puts "Argument: #{a}"
=end

# class Addition
# 	a=[1,5,8,9]
# 	sum=0
# 	a.inject{|sum,x| sum + x }
# 	p=sum
# end
