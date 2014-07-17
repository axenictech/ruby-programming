def command_line
 i=0
sum=0
puts "You gave #{ARGV.size} arguments"
p ARGV


ARGV.each do |i|
	d=i.to_i
  sum += d
end
 p sum 



end
command_line
