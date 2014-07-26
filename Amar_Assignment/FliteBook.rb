<<<<<<< HEAD
require "mysql"	
class FliteBook

	

		  begin	
		  		puts"......................Welcome To Air India......................."
				puts"1.Book Flite"
				puts"2.Exit"
				puts "Enter your choice.."
				choice=gets.to_i
				
				id=1
				case(choice)
				when 1
							 begin #loop for valiating user input until not entering corrct name
                					puts
                					print("Enter Name:")
               						 name=gets
                					
    

               					 if (name=~ /^[-a-z]+$/) #check regular expression for correct name
                
                    					break  #break  loop if user enter corrcect name

                				 else        
                    
                    					puts"Enter only letters...."

                    
                					end 

                
            				 end while (name!=~ /^[-a-z]+$/)

							puts"Select City From:"
							puts"1.Delhi"
							puts"2.Chennai"
							puts"3.Kolhapur"
							puts"4.Benglore"
							from=gets.to_i
							con=Mysql.connect("localhost","root","129129129","FliteBook")
							puts"got connection......"
								if(from==1)
										source="Delhi"
										res=con.prepare("select cost from payment where dest=?")
										res.execute("Delhi")
										while row=res.fetch do
													payment=row[0]
										end	
										
								elsif(from==2)
										source="Chennai"
										res=con.prepare("select cost from payment where dest=?")
										res.execute("chennai")
										while row=res.fetch do
													payment=row[0]
										end	
								elsif(from==3)
										source="kolhapur"	
										res=con.prepare("select cost from payment where dest=?")
										res.execute("kolhapur")
										while row=res.fetch do
													payment=row[0]
										end	
								else
										source="Benglore"	
										res=con.prepare("select cost from payment where dest=?")
										res.execute("benglore")
										while row=res.fetch do
													payment=row[0]
										end	
								end				

							puts"Select City To:"
							puts"1.Delhi"
							puts"2.Chennai"
							puts"3.Kolhapur"
							puts"4.Benglore"
							to=gets.to_i
								if(to==1)
										dest="Delhi"
								elsif(to==2)
										dest="Chennai"
								elsif(to==3)
										dest="kolhapur"	
								else
										dest="Benglore"	
								end	

								begin
										

										# res=con.query("select last(id) as LAST_ID from Booked")
										#  puts res

										res=con.query("select id from Booked")
											while row=res.fetch_row do
													id+=row[0].to_i
											end		



										stmt=con.prepare("insert into Booked values(?,?,?,?,?)")
												id+=1
												stmt.execute(id,name,source,dest,payment)
												puts"your #{source} to #{dest} Flite Booked successfully............in just Rs#{payment}/-"
												con.commit
 
								rescue Mysql::Error =>e
										puts"Eror--------->:#{e}"
			
   								ensure
										con.close
								end		
					


				when 2
							break
				else
						puts("wrong choice.....")
				end
				print("Do you Want to Continue.....[Y/N]----->")
       		 	@option=gets
        
   			end while(@option=~/^[y]+$/)


		
     	
       
        
end
			
=======
require "mysql" 
class FliteBook

    

          begin 
                puts"......................Welcome To Air India......................."
                puts"1.Book Flight"
                puts"2.Cancle Ticket"
                puts"3.Exit"
                puts "Enter your choice.."
                choice=gets.to_i
                con=Mysql.connect("localhost","root","129129129","FliteBook")
                
                
                id=1
                case(choice)
                when 1
                             begin #loop for valiating user input until not entering corrct name
                                    puts
                                    print("Enter Name:")
                                    name=gets

                                   
                                    
    

                                 if (name=~ /^[-a-z]+$/) #check regular expression for correct name
                
                                        break  #break  loop if user enter corrcect name

                                 else        
                    
                                        puts"Enter only letters...."

                    
                                    end 

                
                             end while (name!=~ /^[-a-z]+$/)


                            begin 
                                    puts"Select City From:"
                                    puts"1.Delhi"
                                    puts"2.Chennai"
                                    puts"3.Kolhapur"
                                    puts"4.Benglore"
                                    f=gets

                                    
                                    if (f=~ /^[-0-4]+$/) #check regular expression for correct rating
                                            from=f.to_i
                                          break #break  loop if user enter corrcect rating
                                    else

                                            puts"Enter only no......"
                                    end

                            end while(f!=~ /^[-0-4]+$/)
            
                            
                                if(from==1)
                                        source="Delhi"
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("Delhi")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                        
                                elsif(from==2)
                                        source="Chennai"
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("chennai")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                elsif(from==3)
                                        source="kolhapur"   
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("kolhapur")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                else
                                        source="Benglore"   
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("benglore")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                end 


                            begin   
                                    puts"Select City To:"
                                    puts"1.Delhi"
                                    puts"2.Chennai"
                                    puts"3.Kolhapur"
                                    puts"4.Benglore"
                                    t=gets


                                    if (t=~ /^[-0-4]+$/) #check regular expression for correct rating
                                            to=t.to_i
                                          break #break  loop if user enter corrcect rating
                                    else

                                            puts"Enter only no......"
                                    end

                            end while(t!=~ /^[-0-4]+$/)


                                if(to==1)
                                        dest="Delhi"
                                elsif(to==2)
                                        dest="Chennai"
                                elsif(to==3)
                                        dest="kolhapur" 
                                else
                                        dest="Benglore" 
                                end 

                                begin
                                        puts"your #{source} to #{dest} Flite Required #{payment}/- "
                                        puts"Are you sure to Book flight .........[y/n]"
                                        ans=gets
                                        if(ans=~/^[y]+$/) # getting permission from user for booking ticket

                                                puts
                                                res=con.query("select id from Booked")
                                                while row=res.fetch_row do
                                                    id+=row[0].to_i
                                                end     



                                                stmt=con.prepare("insert into Booked values(?,?,?,?,?)")
                                                id+=1
                                                stmt.execute(id,name,source,dest,payment)
                                                puts"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                                                puts"your #{source} to #{dest} Flite Booked successfully............in just Rs#{payment}/-"
                                                puts"Plz Download your Ticket ------> WWW.AirIndia.co.in"
                                                puts"Your Ticket no:#{id}"
                                                puts"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                                                con.commit
                                        else
                                            puts"your #{source} to #{dest} Flight Required Has been cancled- "      
                                        end 
 
                                rescue Mysql::Error =>e
                                        puts"Eror--------->:#{e}"
            
                                ensure
                                        con.close
                                end     
                    

                when 2 # updated & delete if user want to cancel ticket

                        puts"Plz Enter your Ticket no:"
                        ticket=gets.to_i

                        res=con.prepare("delete from Booked where id=?")
                            res.execute(ticket)
                            puts"Your ticket has been Canceled......"
                                            

                when 3
                            break
                else
                        puts("wrong choice.....")
                end
                print("Do you Want to Continue to Book Another Ticket.....[Y/N]----->")
                @option=gets
        
            end while(@option=~/^[y]+$/)
        
       
        
end
            
>>>>>>> 95738983f95cae67e248c4aee2b9a623f894f49b
