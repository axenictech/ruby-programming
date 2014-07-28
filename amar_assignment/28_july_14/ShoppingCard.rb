require "mysql" 
class ShoppingCard

    

            begin
                   
               con=Mysql.connect("localhost","root","129129129")
               con.query("CREATE DATABASE IF NOT EXISTS shopping")
               con.quantity("use shopping")
               con.query("create table uid int(30),name varchar(20),primary key(uid)")
               con.query("create table product_storage pid int(20),pname varchar(30),quantity int(30),prize int(30),primary key(pid)")
               con.query("create table cart uid int(30),cart_no int(30),foreign key(uid) references user(uid),primary key(cart_no)")
               con.query("create table inline_item cart_no int(30),pid int(30),quantity int(35),
                foreign key(cart_no)references cart(cart_no),foreign key(pid)references product_storage(pid)")
               con.query("create table bill bill_no int(25),cart_no int(30),total int(35),
                foreign key(cart_no) references cart_no(cart_no),primary key(bill_no)")



            rescue Exception => e

                puts e
                    
                    
            end

           

               con=Mysql.connect("localhost","root","129129129","shopping")
                                
               begin print" \n Plz Enter your name:"
                        name=gets
                         if (name=~ /^[-a-z]+$/) #check regular expression for correct name
                
                            break  #break  loop if user enter corrcect name

                                 else        
                    
                                        puts"Enter only letters...."

                    
                         end 

                
                end while (name!=~ /^[-a-z]+$/)
                
               

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

               

               begin res=con.query("select * from product_storage")
                print"\n ..............Welcome To Amanora-Mall.............."
                puts
                puts"\n pid \t Pname \t quantity\tprize"
                puts"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                while row=res.fetch_row do
                        print"",row[0]
                        print"\t  ",row[1]
                        print"\t  ",row[2]
                        print"\t     ",row[3] 
                        puts                   
                end

                
               
               begin  print "\n Enter your Product Id to purchase:"
                      ch=gets
                   
                        if (ch=~ /^[-0-9]+$/) #check regular expression for correct rating
                        
                                choice=ch.to_i
                                break #break  loop if user enter corrcect rating
                        else

                                    puts"Enter only no......"
                        end

               end while(ch!=~ /^[-0-9]+$/)             
                
                case(choice)

                when 100
                            puts"\n You have selected bags"
                            print"\n Enter How many bag do u want:"
                            bagno=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='bag'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(bagno<avilable)

                                            
                                            res2=con.prepare("insert into inline_item values(?,?,?)")
                                            res2.execute(cart_no,choice,bagno)
                                            tot=prize*bagno
                                          

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

                                                     totquqntity=avilable-bagno
                                                     grandtot=totquqntity.to_i

                                                     # res=con.prepare("insert into remainquan values(?,?)")
                                                     # res.execute(choice,grandtot)

                                                     res=con.prepare("update product_storage set quantity=(?) where pid=100")
                                                     res.execute(grandtot)
                                            




                                else

                                        puts"\n Sorry !!!#{bagno} bags are not avilable we have only #{avilable} bags"
                                end
                    
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


                when 107
                            break
                else
                        puts("wrong choice.....")
                end

                print("Do you Want to Buy another...???....[Y/N]----->")
                @option=gets

                    if(@option=~/^[n]+$/)
                            totbill=0
                            res=con.query("select total from bill where cart_no=(select cart.cart_no from cart order by cart_no desc limit 1)")
                            while row=res.fetch_row do
                                  totbill+=row[0].to_i
                            end  
                            puts"Your Bill-Receipt"
                            
                            puts" cart_no \t pid  \t name \tquantity   \t price"
                            puts"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

                            # res=con.query("select inline_item.cart_no,inline_item.pid,product_storage.pname,inline_item.quantity,
                            # bill.total from inline_item,product_storage,bill 
                            # where inline_item.cart_no=(select cart_no from inline_item order by pid desc limit 1) 
                            # and product_storage.pname=(select product_storage.pname from product_storage where pid=inline_item.pid) and
                            #  bill.total=(select bill.total from bill where cart_no=inline_item.cart_no)
                            #  and inline_item.quantity=(select inline_item.quantity from inline_item order by pid desc limit 1)")
                        
                            res=con.prepare("select i.cart_no,i.pid,p.pname,i.quantity,p.prize from inline_item i
                                ,product_storage p where i.cart_no=? and p.pid=i.pid")
                            res.execute(cart_no)

                            while row=res.fetch do
                                print" ",row[0]
                                print"\t\t",row[1]
                                print"\t  ",row[2]
                                print"\t  ",row[3]
                                print"\t\t   ",row[4]
                                puts
                            end    
                            puts"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                            print"Your total Bill:\t\t\t\t  ",totbill
                            puts
                    end       

        
            end while(@option=~/^[y]+$/)
        
       
end
            