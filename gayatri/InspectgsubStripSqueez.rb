class Inspect
 def a
	puts "Enter Your any String:"
	name=gets.inspect
	puts name
 end
 def b
	puts "Enter Your any String:"
	n = gets
	puts n.gsub(/([aeiou])/, '<\1>') 
 end
 def c
	puts "Enter Your any String:"
	x= gets.strip
	puts x

 end
 def d
	puts "Enter Your any String:"
	y= gets.squeeze
	puts y

 end
end
i=Inspect.new
i.a
i.b
i.c
i.d