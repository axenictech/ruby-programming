class Hashing
	def h1
		h =Hash["a" => 100, "b" => 200]
		puts "#{h['a']}"
		puts "#{h['b']}"
	end
	def h2
		a1=Hash["a"=>"Gayatri","b"=>"Yewale"]
		a2=Hash["b"=>"Yeole","c"=>"Pravin"]
		c = a1.merge!(a2)
		puts c
	end
	def h3
		h =Hash["b" => 200,"a" => 100,"d" =>250,"c" =>300]
		n = h.sort
		s = h.length
		puts n
		puts "Length of hash value : #{s}"
	end
	def h4
		a=Hash["a"=>"Avd","b"=>"Swp","c"=>"gps"]
		a.each do|key,value|
			puts "#{key} :: #{value}"
		end
	end
	def h5
		a=Hash["a"=>1,"b"=>2,"c"=>3]
		b=a.invert 
		puts b
	end

end
i = Hashing.new
i.h1
i.h2
i.h3
i.h4
i.h5