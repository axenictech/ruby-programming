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
							print"Enter Name:"
							name=gets
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
			