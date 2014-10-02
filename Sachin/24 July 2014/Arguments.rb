
def additionARGV
	start=0
	#arguments passed while program running
	ARGV.each do |i| 
		endi=i.to_i
		start =start+endi
	end
	puts "Addition of inputs = #{start}"
end
additionARGV


