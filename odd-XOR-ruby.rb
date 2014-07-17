def odd

	no=gets.to_i
    
    puts "odd no's is : "
    icnt=0
    loop do 
    	icnt+=1
    	next if (icnt ^ 1) == icnt+1
    	puts icnt
    	break if icnt <= no

    	
    
end


end

odd