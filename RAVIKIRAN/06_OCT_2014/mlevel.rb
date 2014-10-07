class A
	def initialize
		puts "I am A class"
	end

	def amethod
		puts "Method A"
	end
end

class B < A
	def initilize
		puts "I am B class"
	end

	def bmethod
		puts "Method B"
	end
end

class C < B
	def initialize
		puts "I am C class"
	end

	def cmethod
		puts "Method C"
	end
end

oc=C.new
oc.amethod
oc.bmethod
oc.cmethod