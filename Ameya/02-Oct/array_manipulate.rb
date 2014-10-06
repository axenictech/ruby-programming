first=Array.new()
second=Array.new()

first=["a","b","c"]
second=["x","y","z"]

ans=Array.new()
for i in 0..2 
	ans[i]=first[i]+second[i]
end

puts "Output : #{ans}"