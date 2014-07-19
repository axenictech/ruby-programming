class Assignment5

	str1="abc"
	str2="xyz"
	puts str1
	puts str2

	#puts("#{str1[0,1]}#{str2[0,1]}#{str1[1,1]}#{str2[1,1]}#{str1[2,1]}#{str2[2,2]}")
	for i in 0..str1.length-1
		
			print str1[i].chr
			print str2[i].chr
		
	end
			puts
end

