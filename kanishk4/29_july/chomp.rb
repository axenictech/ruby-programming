puts "Enter first string"
str=gets

puts "length without chop #{str.length}"
puts "length with chop #{str.chop.length}"
puts "length with chomp #{str.chomp}"