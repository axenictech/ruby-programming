class Foo
	def shout
		puts "I'm Foo"
	end
end

foo=Foo.new
foo.shout

class Foo
	def shout
		puts "I'm still Foo, but i have been overridden"
	end
end

foo.shout