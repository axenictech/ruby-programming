module A
   def a1
   		puts "Hello,from module A"
   end
end
module B
	include A
	def b1
		puts "Hi,from module B"
	end
end
class AB
	include B
	def ab1
		puts "In class AB :)"
	end
end
var=AB.new
var.ab1
var.b1
var.a1