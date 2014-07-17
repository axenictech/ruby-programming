
def odd

	no=gets.to_i
    
    puts "odd no's is : "
    icnt=0
    loop do 
    	icnt+=1
    	next if (icnt & 1)==0
    	puts icnt
    	break if icnt >= no

    	
    
end


end

odd

=begin
	
rescue Exception => e
	
end
anuja@anuja-Aspire-5738:~/My$ ruby odd-and-ruby.rb 
7
odd no's is : 
1
3
5
7
anuja@anuja-Aspire-5738:~/My$ 
=end