require 'mysql'
class Shop
def initialize	


def start
	begin
		@con=Mysql.connect('localhost','root','root','MyDB')
		puts "\n\n\n\t---------------BK Shopping Cart--------------------\n\n"
		puts "\n\n\t****************Select Category*****************\n"
		puts "\n\n\t1.Books \t2.Computers\t 3.Mobiles\t 4.Home & Kitchen"
		print "\n\n Please choose your category :"
		category=gets.to_i
		case (category)
		when 1
			stmt1=@con.query("select id,name,price from books")
			while row=stmt1.fetch_row do
				@id=row[0] 
				@name=row[1]
				@price=row[2]

				print "\n\nProduct ID #{@id}. Title: #{@name} Rs: #{@price}"
			end
			print "\n\nEnter Product ID of book :"
			id=gets.to_i
			stmt3=@con.prepare("select price,id,name from books where id=?")
			stmt3.execute(id)
			row=stmt3.fetch
				pruduct_price=row[0]
				pruduct_id=row[1]
				book_name=row[2]
				print "\nFrom books your price is RS.#{pruduct_price} ID is : #{pruduct_id} Book Name: #{book_name}" 
		when 2
			
	
		#Case end			
		end
		#Start end
	end


		print "\n\nDo you want to purchace [Y/N]  "
		temp=gets.chomp
		if temp=='y'
				print "\n\nEnter quantity : "

				qua=gets.to_i
				price=pruduct_price.to_i
				book_price=price*qua
				 stmt2=@con.prepare("insert into cart values(?,?,?,?)")
				 stmt2.execute(pruduct_id,book_price,qua,book_name)
				 puts "Product #{book_name} is added into cart and your TOTAL is Rs.#{book_price} Do you want to buy any other product [Y/N]"
				 temp1=gets.chomp
				 
				 if temp1=='n'
				 	puts "Thank You for using our application select one option from following:"
				 	puts "\n\n\t 1.New Sign-Up\t 2.Existing User"
				 	login=gets.to_i

				 	if login==1
				 		def passwordNew
				 			puts
					 		print "Enter password :"
					 		@@new_User_Password=gets.chomp
					 		print "Re-enter password :"
					 		@@new_User_Password_re=gets.chomp
					 	#DEF
				 		end
				 		puts "\nEnter the following details"
				 		print "Name: "
				 		@new_User_Name=gets.chomp
				 		print  "Phone Number : +91 "
				 		new_User_Phone=gets.chomp
				 		print "Email ID : "
				 		@login_email=gets.chomp
				 		print "Address :"
				 		new_User_Add=gets.chomp
				 		passwordNew
								if @@new_User_Password==@@new_User_Password_re

							 			stmt5=@con.prepare("insert into user values(?,?,?,?,?)")
							 			stmt5.execute(@new_User_Name,new_User_Phone,@login_email,@@new_User_Password,new_User_Add)

					 					puts "\tThank You, #{@new_User_Name} for registering with us."
					 					puts "\tYour user id is : #{@login_email}\n"

					 				else
					 				puts "!!!!!!!!----Password not matched Re-enter your password----!!!!!!!!"
					 				passwordNew
				 				#IF
				 				end	
				 	elsif login==2
				 		print "\n\n\nEnter your email id :"

				 		@login_email=gets.chomp
				 		stmt9=@con.prepare("select email,password from user where email=?")
				 		stmt9.execute(@login_email)
				 		#stmt14=@con.prepare("select name from user")
				 			while row=stmt9.fetch do
				 				login_e=row[0]
				 				login_p=row[1]
				 				# puts "#{login_e} , #{login_p}"
				 			end
				 			print "\n\nEnter password : "
				 			temp_password=gets.chomp
				 			if temp_password==login_p
				 				puts "\n\n\tlogin succesfully....!!!!"
				 			else temp_password!=login_p
				 				puts "Password did not matched....!!!!"
				 				start
				 			end

				 	else		 		
						puts "Please enter valid choice"
						start
			 		end
			 				puts ""
			 				print "\n\nSelect your payment mode:\t1. Cash \t2.Card"
			 				payment=gets.to_i
			 				stmt12=@con.prepare("select address from user where email=?")
			 				stmt12.execute(@login_email)
			 				row12=stmt12.fetch
			 					result12=row12[0]
			 					puts "ADDRESSSSSSSSSS : #{result12}"
			 				case (payment)
			 					when 1
			 						puts "\n\nThank you. You have selected Cash on delivery. the product will delivered within 7 working days on your addess:\n #{result12}"
			 						#final_pay="CASH"
			 						payment_mode="CASH"
			 					when 2
			 						print "Enter card number :"
			 						final_pay=gets.chomp
			 						payment_mode="CARD"
			 						puts "\n\nThank you. You have done online payment.The product will delivered within 7 working days on your addess:\n #{result12}"
			 				else 
			 						puts "\n\n\t\tWrong choice "
			 						start
			 				end
			 				stmt7=@con.query("select order_id from orderdetails")
			 				while row=stmt7.fetch_row do
			 					result=row[0]
			 				end
			 				result=result.next

			 				stmt10=@con.query("select sum(price) from cart")
			 				row10=stmt10.fetch_row
			 					result10=row10[0]

			 				stmt13=@con.query("select sum(quantity) from cart")	
			 				row13=stmt13.fetch_row
			 					result13=row13[0]
			 				stmt6=@con.prepare("insert into orderdetails values(?,?,?,?,?,?,?)")
			 				stmt6.execute(result,@name,result13,result10,payment_mode,final_pay,@login_email)
			 				
			 				

			 				puts "\n\nYour total bill is Rs.#{result10}"
			 				puts "\n\n Payment Mode is:#{payment_mode}"
			 				stmt8=@con.query("delete from cart")
			 			
			 		elsif temp=='n'
			 			puts "\n\n\t\tTHANK YOU"
			 			#break
			 		else
			 			puts "\n\n\t\tEnter correct choice"
			 			start

				end
		end

	#begin end	
end
#def initialize
end
#class end
end
S_Obj=Shop.new
S_Obj.start