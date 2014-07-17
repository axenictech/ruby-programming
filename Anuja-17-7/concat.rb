def concat
	arr="abc"
	brr="xyz"
	crr=""
	i=0
	arr.each_char do |temp|
	print crr = temp+brr[i]
	i=i+1;
end
end
concat