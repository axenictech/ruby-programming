#program for reverse the no
class Reverse

		puts"Enter no:"
		no=gets.to_i #store and covert on into int
		rev=0
		a=no
		while (no>0)
			a=no%10			#find last digit
			rev=rev*10+a  	#calculate rev
			no=no/10;		#calculate and update no	
		
		end
		print "Reverse no:",rev #print no after reverse
		puts
	end

