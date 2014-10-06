day=Hash.new("month")
day={"1"=>'Sunday',"2"=>'Monday'}
puts "****************start*****************"
hash1=day.keys
puts "Keys of hash : #{hash1}"
puts "*************************************"
hash2=day.default
puts "Default value of hash : #{hash2}"
puts "*************************************"
hash3=day.index("Sunday")
puts "Index of value sunday : #{hash3}"
puts "*************************************"
hash4=day.invert
puts "Inverting the hash : #{hash4}"
puts "*************************************"
hash5=day.length
puts "length of hash : #{hash5}"
puts "*************************************"
hash6=day.sort
puts "Sorted hash : #{hash6}"
puts "*************************************"
hash7=day.size
puts "Size of the hash : #{hash7}"
puts "******************End****************"