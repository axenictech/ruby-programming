
#accept no from user and print all odd no till that no

#logic used is simple no%2 method

def odd

	no=gets.to_i
    
    puts "Even no's is : "
    icnt=0
    loop do 
    	icnt+=1
    	next if icnt % 2 == 0
    	puts icnt
    	break if icnt >= no

    	
    
end

end
odd


=begin  Output
	
anuja@anuja-Aspire-5738:~/My$ ruby evenRuby.rb
9
odd no's is : 
1
3
5
7
9

	
=end