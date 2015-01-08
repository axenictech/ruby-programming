# array manipulation EX- a[]={a,,c,d} b[]={x,y,z} output:- c[]={ax,by,cz}



def arrManup
		puts "\n\n\n::::::::::::::::Program Showing Array manuplution Operation:::::::::::::::::::::::::::::::::::::::::::::\n\n"

		a = []
		b = []
		c = []	

		puts "Enter Your 1st Array elements (Fallowed by Enter)  [ press * to stop your Input ]"
		
		loop do
			element = gets.chomp
			
			 	  	if (element == '*')
			 	  	break

			 			else
						a << element

					 end
		
		end
		puts"#{a}"		
		puts "Enter Your 2nd Array elements (Fallowed by Enter)  [ press * to stop your Input ]"
		loop do
			element = gets.chomp
			 	 	if (element == '*')
			 	 	break 		
			 	 		 			
			 			else
						b << element

					end
		
		end
		puts"#{b}"	
		# puts "Your Merged new Array #{c}"	

		if a.length < b.length  
			i=0
			while (i<b.length)							
					while(i<a.length)
						c[i] = (a[i]<<b[i])
						i+=1
						if(i==b.length)
							break
						end
						
					end	
                    if(i==b.length)
                        break
                    end
					c[i]=b[i]		
				i+=1
			end
		
		else			  
			i=0
			while (i<a.length)						
					while(i<b.length)
						c[i] = (a[i]<<b[i])	
                        # puts"..........................#{c[i]}"					
						i+=1
						if(i==a.length)
							break
						end

					end	
					if(i==a.length)
                        break
                    end
					c[i] = a[i]	
				i+=1
			end		
			 
		end
        puts "Your Merged new Array #{c}"
	end
    arrManup
