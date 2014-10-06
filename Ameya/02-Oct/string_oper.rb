class StringDemo

	puts"Enter 1st String:"
	str1=gets
	puts"Enter 2nd String:"
	str2=gets
	len=str1.length+str2.length
	str3=len;
			
	for i in 0..str1.length

		for j in 0..str2.length

			str3[i]=str1[i]
			str3[i+1]=str[j]
			print str3
 
		end
	end		
end