class Merging

	a="xyz"
	b="abc"
	cc=""
	i=0
	a.each_char do |c|
		cc=cc+c
		b.each_char do |d|
			puts cc+=b[i]
			
		end
		
	end
	p cc
end
