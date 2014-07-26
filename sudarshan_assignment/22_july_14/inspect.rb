# use inspect concept and learn how is work

puts "Enter first string"
str=gets

puts "value without inspect #{str}"

puts "value with inspect #{str.inspect}"

str=gets.chop

puts "value without inspect (chop)#{str}"

puts "value with inspect (chop)#{str.inspect}"