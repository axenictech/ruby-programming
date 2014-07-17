
def odd

	no=gets.to_i
    
    puts "odd no's is : "
    icnt=0
    loop do 
    	icnt+=1
    	next if (icnt or 1) > icnt
    	puts icnt
    	break if icnt >= no

    	
    
end


end

odd

=begin
	
rescue Exception => e
	
end

anuja@anuja-Aspire-5738:~/My$ ruby odd-or-ruby.rb 
7
odd no's is : 
1
2
3
4
5
6
7
=end