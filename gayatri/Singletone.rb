class Singletone
	def h
		puts "hello"
	end
end
a=Singletone.new
b=Singletone.new
	def a.h
	puts "Welcome to Singletone"
	end
a.h
b.h