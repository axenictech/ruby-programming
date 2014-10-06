ary = [1,2,3,4,5]
ary.each do |i|
   puts "Iterator using each : #{i}"
end
puts "********************************************"
b = Array.new
b = ary.collect
puts "Iterator using each : #{b}"