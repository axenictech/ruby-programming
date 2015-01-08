def swap
puts "\n\n\n::::::::::::::::Program Showing Swap 2 no without 3rd variable:::::::::::::::::::::::::::::::::::::::::::::\n\n"


printf "\nEnter Your First Number  [NO1]  : "
no_1 =gets().chomp().to_i

printf "\nEnter Your second Number [NO2]  : "
no_2 =gets().chomp().to_i

printf "\nNumber Before swap: [NO1] :#{no_1}\t [NO2] :#{no_2}\n"


		no_1 += no_2
		no_2 = no_1-no_2
		no_1 = no_1-no_2



printf "\nNumber  After swap: [NO1] :#{no_1}\t [NO2] :#{no_2}\n"


puts "\n\n\n::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::\n\n"
end
swap
