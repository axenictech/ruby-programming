class Parent
end

class Child < Parent
end

puts "the superclass of class Child is #{Child.superclass}" #answer Parent

puts "the superclass of class Child is #{Parent.superclass}" #answer Object

puts "the superclass of class Child is #{Object.superclass}" #answer BasicObject

puts "the superclass of class Child is #{BasicObject.superclass}" #answer nil