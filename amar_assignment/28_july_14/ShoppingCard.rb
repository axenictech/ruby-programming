
#small application for shopping cart

require "mysql"
require "terminal-table" 
class ShoppingCard

    

            begin
                
               #connet to database 
               con=Mysql.connect("localhost","root","129129129") 
                #check for database if not present then create 
                # use shopping database    
               con.query("CREATE DATABASE IF NOT EXISTS \ shopping") 
               con.query("use shopping")    

                 #check for database tables if not present 
                 #then create all required tables

               con.query("create table if not exists \ user(
                uid int(30),name varchar(20),primary key(uid))")    

               con.query("create table if not exists \ 
                product_storage (pid int(20),pname varchar(30),quantity int(30),prize int(30),primary key(pid))")

               con.query("create table if not exists \ cart (uid int(30),cart_no int(30),foreign key(uid) references user(uid)
                ,primary key(cart_no))")


               con.query("create table if not exists \ inline_item (cart_no int(30),pid int(30),quantity int(35),
                foreign key(cart_no)references cart(cart_no),foreign key(pid)references product_storage(pid))")


               con.query("create table if not exists \ bill (bill_no int(25),cart_no int(30),total int(35),
                foreign key(cart_no) references cart(cart_no),primary key(bill_no))")

               res=con.query("select* from product_storage")

                #check table contents if emptey then
                #insert all required values

               if (row1=res.fetch_row).nil?   

                     con.query("insert into product_storage values (100,'bag',20,300)")
                     con.query("insert into product_storage values (101,'shirt',20,400)")
                     con.query("insert into product_storage values (102,'jeans',20,700)")
                     con.query("insert into product_storage values (103,'pizza',20,40)")
                     con.query("insert into product_storage values (104,'pepsi',20,30)")
                     con.query("insert into product_storage values (105,'saree',20,1000)")
                     con.query("insert into product_storage values (106,'bat',20,800)")
                end

            rescue Exception => e   

                puts e
                    
                    
            end

           

              
               #getting user details                  
               begin 
                        print" \n Plz Enter your name:"
                        name=gets
                         if (name=~ /^[-a-z]+$/) #check regular expression for correct name
                
                            break  #break  loop if user enter corrcect name

                                 else        
                    
                                        puts"Enter only letters...."

                    
                         end 

                
                end while (name!=~ /^[-a-z]+$/) #continue until user not enter correct name
                
               
               #create unique user id each time and store in to user table 

                res=con.query("select uid from user order by uid desc limit 1")
                row=res.fetch_row
                if row.nil?
                    id=100
                    
                else
                    no=row[0].to_i
                    id=no+1
                end
                res=con.prepare("insert into user values(?,?)")
                res.execute(id,name)

                #create unique cart no each time and store in to cart table 

                res=con.query("select cart_no from cart order by uid desc limit 1")
                row=res.fetch_row
                if row.nil?
                    cart_no=1001
                    
                else
                    no=row[0].to_i
                    cart_no=no+1
                end
                res=con.prepare("insert into cart values(?,?)")
                res.execute(id,cart_no)

               
              
               begin 
                
                        #display menu to user
                        res=con.query("select * from product_storage")
                        rows=[]
                        table=Terminal::Table.new
                        table.headings=["product Id"," Name"," quantitty","Price"]

                        while res3=res.fetch_row do

                                rows<<[res3[0],res3[1],res3[2],res3[3]] 
                        end

                                table.rows=rows
                                puts "\n#{table}"
            

                        begin 
                                 #getting user choice according to product id
                                 print "\n Enter your Product Id to purchase:"
                                 ch=gets
                   
                                if (ch=~ /^[-0-9]+$/) #check regular expression for correct rating
                                       
                                        choice=ch.to_i
                                        break #break  loop if user enter corrcect rating
                                else

                                    puts"Enter only no......"
                                 end

                        end while(ch!=~ /^[-0-9]+$/)  #continue until user not enter correct choice           
                
                         case(choice)

                         #perform operation if user choice is 100   
                         when 100
                                     puts"\n You have selected bags"
                                     print"\n Enter How many bag do u want:"
                                     bagno=gets.to_i
                                     #getting quqntity and prize of product 
                                     res=con.query("select quantity,prize from product_storage where pname='bag'")
                                     row=res.fetch_row
                                     avilable=row[0].to_i
                                     prize=row[1].to_i

                                    #check for avilable stock in store
                                    if(bagno<avilable)

                                            #insert user selected item into inline_item 
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,bagno)
                                            tot=prize*bagno

                                            #create unique bill no each time and store in to bill table

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                            row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     #insert bill no  cart no total bill into bill table 
                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     #calculate remaining product quantity
                                                     totquqntity=avilable-bagno
                                                     grandtot=totquqntity.to_i

                                                     #update 
                                                     res=con.prepare("update product_storage set quantity=(?) where pid=100")
                                                     res.execute(grandtot)
                                        
                                else

                                          puts"\n Sorry !!!#{bagno} bags are not avilable we have only #{avilable} bags"
                                end
                 #perform operation if user choice is 101 follow same logic as product no 100  
                when 101

                            puts"\n You have selected sirt"
                            print"\n Enter How many shirt do u want:"
                            shirtno=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='shirt'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(shirtno<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,shirtno)
                                            tot=prize*shirtno
                                          

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                 end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     totquqntity=avilable-shirtno
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=101")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{shirtno} shirts are not avilable we have only #{avilable} shirts"
                                end

                 #perform operation if user choice is 102 follow same logic as product no 100  
                when 102


                            puts"\n You have selected jeans"
                            print"\n Enter How many jeans do u want:"
                            jeansno=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='jeans'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(jeansno<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,jeansno)
                                            tot=prize*jeansno
                                          

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                 end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     totquqntity=avilable-jeansno
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=102")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{jeansno} jeans are not avilable we have only #{avilable} jeans"
                                end

                #perform operation if user choice is 103 follow same logic as product no 100
                when 103
                    
                            puts"\n You have selected pizza"
                            print"\n Enter How many pizza do u want:"
                            pizzano=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='pizza'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(pizzano<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,pizzano)
                                            tot=prize*pizzano
                                          

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                 end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     totquqntity=avilable-pizzano
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=103")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{pizzano} pizza are not avilable we have only #{avilable} pizza"
                                end

                #perform operation if user choice is 104 follow same logic as product no 100
                when 104


                            puts"\n You have selected pepsi"
                            print"\n Enter How many bag do u want:"
                            pepsino=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='pepsi'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(pepsino<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,pepsino)
                                            tot=prize*pepsino
                                          

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                 end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     totquqntity=avilable-pepsino
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=104")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{pepsino} pepsi are not avilable we have only #{avilable} pepsi"
                                end

                 #perform operation if user choice is 105 follow same logic as product no 100  
                when 105
                            puts"\n You have selected saree"
                            print"\n Enter How many saree do u want:"
                            sareeno=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='saree'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(sareeno<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,sareeno)
                                            tot=prize*sareeno
                                          

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                 end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     totquqntity=avilable-sareeno
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=105")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{sareeno} saree are not avilable we have only #{avilable} saree"
                                end
                #perform operation if user choice is 106 follow same logic as product no 100
                when 106

                            puts"\n You have selected bat"
                            print"\n Enter How many bat do u want:"
                            batno=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='bat'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(batno<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,batno)
                                            tot=prize*batno
                                          

                                            res=con.query("select bill_no from bill order by bill_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    bill_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        bill_no=no+1
                                                 end
                
                                                      puts"\n #{tot} amount added on your cart.........."
                                                      puts"\n your order no is...............:#{bill_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(bill_no,cart_no,tot)

                                                     totquqntity=avilable-batno
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=106")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{batno} bats are not avilable we have only #{avilable} bats"
                                end

                #perform exit operation if user choice is 107 
                when 107
                            break
                else
                        puts("wrong choice.....")
                end

                print("Do you Want to Buy another...???....[Y/N]----->")
                puts
                @option=gets

                    #if user does not required more product then calculate bill and display bill-receipt
                    if(@option=~/^[n]+$/)
                            totbill=0
                            res=con.query("select total from bill where cart_no=(select cart.cart_no from cart order by cart_no desc limit 1)")
                            while row=res.fetch_row do
                                  totbill+=row[0].to_i
                            end  
                        
                            #gather all required fields from diffrent tables and
                            res=con.prepare("select i.cart_no,i.pid,p.pname,i.quantity,(i.quantity*p.prize) from inline_item i
                                ,product_storage p where i.cart_no=? and p.pid=i.pid")
                            res.execute(cart_no)


                             rows=[]
                             count1=0
                            table1=Terminal::Table.new
                            table1.headings=['Name',name,'your bill is as follow']
                            #table1.headings=["cart_no","pid","#name","quantity","price"]
                             

                            
                            rows<<['cart_no','pid','name','quantity','price']
                            rows<<:separator
                            while row=res.fetch do
                             rows<<[row[0],row[1],row[2],row[3],row[4]]
                              count1+=1
                            end

                            rows<<:separator
                            rows<<['','','','TOTAL',totbill]

                            table1.rows=rows

                            puts "#{table1}"



                    end       

        
            end while(@option=~/^[y]+$/)# continue until user not said no 
end
