class Abc
def firstMethod(a="Keep",b=":)")
5.times do |c|
	c="Message for the day is #{a} #{b}"
puts "#{c}"
end
end
def secMethod(*cal)
	s="calculate the lenght"
	puts s.size
	puts s.split
	puts "the value in cal #{cal.length}"
	for i in 0..cal.length
		 puts "calculeted are #{cal[i]}"
	end
	


end
end
ab=Abc.new 
ab.firstMethod 
ab.secMethod "Its","a" ,"good","time"