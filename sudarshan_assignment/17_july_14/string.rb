class Merge

	string1="abc"
	string2="xyz"
	string3=""

	size=string1.length.to_i

	i=0
	j=0
	while i>size

		string3[i]=string1[j]
		string3[i+1]=string2[j]
		i+=2
		j+=1
	end
	print string3
	puts "\t"
end