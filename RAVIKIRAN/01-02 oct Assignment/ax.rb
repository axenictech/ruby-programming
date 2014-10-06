str1=String.new("abc")
puts "Original String str1 is : #{str1}"

str2=String.new("xyz")
puts "Original String str2 is : #{str2}"
s=""
for i in 0..2
f=str1[i]+str2[i]
s=s+f
end
puts "Output string is : #{s}"