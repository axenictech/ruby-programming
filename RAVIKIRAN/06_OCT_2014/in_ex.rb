module Mango
	def show
		puts "This is mango"
	end
end

class Fruit1
	include Mango
end

class Fruit2
	extend Mango
end

Fruit1.new.show

Fruit2.show


