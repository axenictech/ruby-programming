
#small application for shopping cart
require "prawn"
require "prawn/table"
require "mysql"
require "terminal-table" 
class Cart

    
        def initialize
            begin
                
               #@connet to database 
               @con=Mysql.connect("localhost","root","129129129") 
                #check for database if not present then create 
                # use shopping database    
               @con.query("CREATE DATABASE IF NOT EXISTS \ shopping") 
               @con.query("use shopping")    

                 #check for database tables if not present 
                 #then create all required tables

               @con.query("create table if not exists \ user(
                uid int(30),name varchar(20),primary key(uid))")    

               @con.query("create table if not exists \ 
                product_storage (pid int(20),pname varchar(30),quantity int(30),prize int(30),primary key(pid))")

               @con.query("create table if not exists \ cart (uid int(30),cart_no int(30),foreign key(uid) references user(uid)
                ,primary key(cart_no))")


               @con.query("create table if not exists \ inline_item (cart_no int(30),pid int(30),quantity int(35),
                foreign key(cart_no)references cart(cart_no),foreign key(pid)references product_storage(pid))")


               @con.query("create table if not exists \ bill (bill_no int(25),cart_no int(30),total int(35),
                foreign key(cart_no) references cart(cart_no),primary key(bill_no))")

               res=@con.query("select* from product_storage")

                #check table @contents if emptey then
                #insert all required values

               if (row1=res.fetch_row).nil?   

                     @con.query("insert into product_storage values (100,'bag',20,300)")
                     @con.query("insert into product_storage values (101,'shirt',20,400)")
                     @con.query("insert into product_storage values (102,'jeans',20,700)")
                     @con.query("insert into product_storage values (103,'pizza',20,40)")
                     @con.query("insert into product_storage values (104,'pepsi',20,30)")
                     @con.query("insert into product_storage values (105,'saree',20,1000)")
                     @con.query("insert into product_storage values (106,'bat',20,800)")
                end

                #calling getname method  for accept user details...
                getname

                #calling genrateuid method  for genrating unique uid each time...
                genrateuid

                #calling genrate carno method  for genrating unique cart_no each time...
                genratecartno

                #calling menu method for displaying product details to user
                menu

            rescue Mysql::Error => e   

                puts e
                    
                    
            end
       end    

           
             # define getname method for accepting user details
             def getname
                     #getting user details                  
                     begin 
                        print" \n Plz Enter your name:"
                        @name=gets.chomp
                        if (@name=~ /^[A-Z a-z]+$/ and @name.length<=10) #check regular expression for correct name
                
                                break  #break  loop if user enter corrcect name
                        else        
                    
                                puts"Enter Valid name......."
                        end 

                        
                     end while (@name!=~ /^[-a-z]+$/) #@continue until user not enter correct name
             end    

             # define genrateuid method for creating unique uid each time and store into user table
             def genrateuid

                         res1=@con.query("select uid from user order by uid desc limit 1")
                         row10=res1.fetch_row
                         if row10.nil?
                             @id=100
                    
                        else
                             no=row10[0].to_i
                             @id=no+1
                end

                res2=@con.prepare("insert into user values(?,?)")
                res2.execute(@id,@name)
               end

               
                #define genratecartno method for create unique cart no each time and store in to cart table 
                def genratecartno

                         res3=@con.query("select cart_no from cart order by uid desc limit 1")
                         row2=res3.fetch_row
                         if row2.nil?

                              @cart_no=1001
                    
                         else
                              no=row2[0].to_i
                              @cart_no=no+1
                         end

                            res4=@con.prepare("insert into cart values(?,?)")
                            res4.execute(@id,@cart_no)

               end


             #define order method for genrating bill no..
             def order
                             result=@con.query("select bill_no from bill order by bill_no desc limit 1")
                                            ro=result.fetch_row
                                                if ro.nil?
                                                    
                                                    @bill_no=1
                    
                                                else
                                                        no=ro[0].to_i
                                                        @bill_no=no+1
                                                end
               end
              
             #calling menu method for displaying product details to user 
             def menu
                
                        #display menu to user
                        res15=@con.query("select * from product_storage")
                        rows=[]
                        table=Terminal::Table.new
                        table.headings=["product Id"," Name"," quantitty","Price"]

                        while res3=res15.fetch_row do

                                rows<<[res3[0],res3[1],res3[2],res3[3]] 
                        end

                                table.rows=rows
                                puts "\n#{table}"

                                businesslogic
                end          
                
                
               
               #create unique user id each time and store in to user table 

                 def businesslogic

                        begin 
                                 #getting user choice according to product id
                                 print "\n Enter your Product Id to purchase:"
                                 ch=gets
                   
                                if (ch=~ /^[0-9]+$/) #check regular expression for correct rating
                                       
                                        @choice=ch.to_i
                                         res50=@con.prepare("select * from product_storage where pid=?")
                                         res50.execute(@choice)
                                         if (data=res50.fetch).nil? #validation for

                                                 puts"Enter valid product id......"
                                         else
                                                break #break  loop if user enter corrcect rating
                                         end       
                                  else     

                                    puts"Enter only no......"
                                 end

                        end while(ch!=~ /^[0-9]+$/)  #@continue until user not enter correct choice           
                
                    
                                    name1=@con.prepare("select pname from product_storage where pid=?")
                                    name1.execute(@choice)

                                     data=name1.fetch
                                     nm=data[0]
                                       
                        
                                     puts"\n You have selected #{nm}"
                                     print"\n Enter How many #{nm} do u want:"
                                     no=gets.to_i
                                     #getting quqntity and prize of product 
                                     res5=@con.prepare("select quantity,prize from product_storage where pid=?")
                                     res5.execute(@choice)
                                     row3=res5.fetch
                                     avilable=row3[0].to_i
                                     prize=row3[1].to_i

                                    #check for avilable stock in store
                                    if(no<=avilable)

                                            #insert user selected item into inline_item 
                                            res6=@con.prepare("insert into inline_item values(?,?,?)")
                                            res6.execute(@cart_no,@choice,no)
                                            tot=prize*no

                                            #create unique bill no each time and store in to bill table

                                                      order  # call order method to genrate bill no
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{@bill_no}"

                                                     #insert bill no  cart no total bill into bill table 
                                                     res7=@con.prepare("insert into bill values(?,?,?)")
                                                     res7.execute(@bill_no,@cart_no,tot)

                                                     #calculate remaining product quantity
                                                     totquqntity=avilable-no
                                                     @grandtot=totquqntity.to_i

                                                     #update quqntity in product table 
                                                     res8=@con.prepare("update product_storage set quantity=(?) where pid=(?)")
                                                     res8.execute(@grandtot,@choice)
                                                     #call to bill method
                                                     bill
                                        
                                else

                                          puts"\n Sorry !!!#{no}  are not avilable we have only #{avilable} "
                                          menu
                                end
                         end

                def delitem

                             dispbill
                             print"\n Enter product Id to delete Item from cart:"
                             delt=gets.to_i

                            res96=@con.prepare("select quantity from inline_item where pid=? and cart_no=?")
                            res96.execute(delt,@cart_no)
                            row22=res96.fetch
                                    delquan=row22[0]

                                

                            res97=@con.prepare("select prize from product_storage where pid=?")
                            res97.execute(delt)
                            row23=res97.fetch
                                    delprize=row23[0]
                                    @bill=@totbill-(delquan*delprize)


                            res95=@con.prepare("delete from inline_item where pid=?")
                            res95.execute(delt)

                            res1=@con.prepare("update product_storage set quantity=(quantity+?) where pid=?")
                            res1.execute(delquan,delt)

                
                           res19=@con.prepare("select i.cart_no,i.pid,p.pname,i.quantity,(i.quantity*p.prize) from inline_item i
                                ,product_storage p where i.cart_no=? and p.pid=i.pid")
                            res19.execute(@cart_no)

                             rows=[]
                            
                            table1=Terminal::Table.new
                            rows<<['Name',@name,'your bill is as follow','','']
                            #table1.headings=["cart_no","pid","#name","quantity","price"]
                             
                            rows<<[""]
                            rows<<['cart_no','pid','name','quantity','price']
                            rows<<[""]
                            while row=res19.fetch do
                                     rows<<[row[0],row[1],row[2],row[3],row[4]]
                            end
                            rows<<[""]
                            rows<<['','','','TOTAL',@bill]
                            table1.rows=rows
                            print"\n #{table1}" 
                            puts 

                end         
                         
               def bill                 

                     print("Do you Want to Buy another...???....[Y/N]----->")
                     puts
                     @option=gets.chomp

                    #if user does not required more product then calculate bill and display bill-receipt
                    if(@option=="y" or @option=="Y")

                        menu # call menu method
                    end   
                            
                    if(@option=="n" or @option=="N") 

                             @totbill=0     
                            res9=@con.query("select total from bill where cart_no=(select cart.cart_no from cart order by cart_no desc limit 1)")
                            while row4=res9.fetch_row do
                                  @totbill+=row4[0].to_i
                            end  

                            puts"Do u want to delete any items from cart ----->[y/n]:"
                            ans=gets.chomp

                            if(ans=="y")
                                delitem
                            else
                                dispbill
                            end      
                     end  
                
                end

                def dispbill
                                         #gather all required fields from diffrent tables and
                            res10=@con.prepare("select i.cart_no,i.pid,p.pname,i.quantity,(i.quantity*p.prize) from inline_item i
                                ,product_storage p where i.cart_no=? and p.pid=i.pid")
                            res10.execute(@cart_no)

                            
                            res19=@con.prepare("select sum(i.quantity*p.prize) from inline_item i
                                ,product_storage p where i.cart_no=? and p.pid=i.pid")
                            res19.execute(@cart_no)
                            row0=res19.fetch
                            @totbill=row0[0].to_i
                            

                             rows=[]
                            
                            table1=Terminal::Table.new
                            rows<<[@name,'your bill is as follow']
                            #table1.headings=["cart_no","pid","#name","quantity","price"]
                             
                        
                            rows<<['cart_no','pid','name','quantity','price']
                            
                            while row=res10.fetch do
                                     rows<<[row[0],row[1],row[2],row[3],row[4]]
                            end
                            
                            rows<<['','','','TOTAL',@totbill]
                            table1.rows=rows
                            print"\n #{table1}"
                            
                            Prawn::Document.generate("hello.pdf") do
                            table rows
                end

           end          
end

Cart.new