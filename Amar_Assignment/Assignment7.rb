class Assignment7
	
	def add
			puts"Enter no of element:"
			element=gets.to_i
			count=0;
			no=[]
			for i in 1..element
				puts"Enter #{i} no:"
				#val=gets.to_i
				no[i]=gets
				count+=no[i].to_i;
				
				
			end
				
				print "Total:",count
				puts
	end
end
	
	Assignment7.new.add				

