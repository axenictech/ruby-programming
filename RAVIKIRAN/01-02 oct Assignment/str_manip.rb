str=String.new(" THIS IS TEST ")
puts "Original String is : #{str}"

str1=str.downcase
puts "Downcase : #{str1}"

str2=str.capitalize
puts "Capital : #{str2}"

str3=str.strip
puts "Removing leading and trailin white space : #{str3}"

str4=str.hash
puts "Hash : #{str4}"

str5=str.insert(2,"new")
puts "The string new is at 2 position inserted : #{str5}"

str6=str.length
puts "Length of string : #{str6}"

str7=str.reverse
puts "Reverse of string : #{str7}"

str8=str.swapcase
puts "Swapping case : #{str8}"

str9=str.upcase
puts "Uppercase : #{str9}"

str10=str.inspect
puts "Inspect : #{str10}"