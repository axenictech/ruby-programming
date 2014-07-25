#printing only the instance of the the array
result=[]
wierd_arry=["blah", :meow, 42, 90, :building]
puts wierd_arry
wierd_arry.each do |element|
	if element.instance_of?(Symbol)
	puts result.push(element)
end
print result
end

puts "\n\n\n=================="

 sports = ["basketball", "baseball", "football"]

# Iterate over the sports Array and print out the following list:
# "0. basketball"
# "1. baseball"
# "2. football"
# sports = ["basketball", "baseball", "football"]

 sports.each_with_index  do |sport,index|
 	puts index.to_s+sport
 end

puts "\n\n\n=================="

 last_names = ["D", "Krugman"]

# Iterate over last_names and create this array: ["Paul D", "Paul Krugman"]
# array=[]
 # last_names = ["prateema", "Krugman"]

last_names.map do |last_name|
 puts "prateema " + last_name
end


puts "\n\n\n=================="

soap_opera = ["all", "my", "children"]

# Return true if any of the elements in the soap_opera array start with the letter "a" and false otherwise.
soap_opera.any? do |word|
 puts word[0] == "a"
end
puts "\n\n\n=================="

# The any?() method iterates over every element of the array and returns true if the code block is ever true.  Methods with question marks in Ruby return true or false and are called predicate methods.

tools = ["ruby", "rspec", "rails"]

# Return true if every element of the tools array starts with an "r" and false otherwise.

tools.all? do |word1|
	puts word1[0]=="r"
end

puts "\n\n\n=================="

# Return true if the string "stimpy" contains the letter "s" and false otherwise.

puts "stinpy".include?("s")

puts "\n\n\n=================="

# Return true if the string "stimpy" contains the letter "s" and false otherwise
if ("stiny".include?("s")) then 
	puts "true"
else
	puts "false"
end

puts "\n\n\n=================="

captain_planet = ["earth", "fire", "wind", "water", "heart"]

# Create a new array from the captain_planet array with all the elements that contain the letter "a".
new_captain=[]

	captain_planet.select do |wordis|
		if (wordis.include?("a"))
			new_captain.push(wordis)
		end
	end


