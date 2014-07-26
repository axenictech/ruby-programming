require "mysql" 
class ShoppingCard

    

          begin 

                con=Mysql.connect("localhost","root","129129129","shopping")
                
                print"Plz Enter your name:"
                name=gets

                
               

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

               

                res=con.query("select * from product_storage")
                puts"......................Welcome To @m@nor@-m@ll......................."
                puts
                puts"pid \t Pname \t quantity \tprize"
                puts"~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
                while row=res.fetch_row do
                        print"",row[0]
                        print"\t  ",row[1]
                        print"\t  ",row[2]
                        print"\t    ",row[3] 
                        puts                   
                end

                
               
                print "Enter your Product Id to purchase:"
                choice=gets.to_i
                                
                
                case(choice)
                when 100
                            puts"You have selected bags"
                            print"Enter How many bag do u want:"
                            bagno=gets.to_i
                            res=con.query("select quantity,prize from product_storage where pname='bag'")
                            row=res.fetch_row
                                avilable=row[0].to_i
                                prize=row[1].to_i

                                if(bagno<avilable)

                                            res=con.prepare("insert into inline_item values(?,?,?)")
                                            res.execute(cart_no,id,bagno)
                                            tot=prize*bagno
                                          

                                            res=con.query("select order_no from bill order by order_no desc limit 1")
                                             row=res.fetch_row
                                                if row.nil?
                                                    
                                                    order_no=1
                    
                                                else
                                                        no=row[0].to_i
                                                        order_no=no+1
                                                 end
                
                                                      puts"#{tot} amount added on your cart.........."
                                                      puts"your order no is...............:#{order_no}"

                                                     res=con.prepare("insert into bill values(?,?,?)")
                                                     res.execute(order_no,cart_no,tot)

                                                     totquqntity=avilable-bagno
                                                     res=con.query("update product_storage set quantity=totquqntity where pid=100")


                                else

                                        puts"Sorry !!!#{bagno} bags are not avilable we have only #{avilable} bags"
                                end
                    
                when 101

                    
                when 102


                when 103
                    

                when 104

                    
                when 105


                when 106


                when 107
                            break
                else
                        puts("wrong choice.....")
                end
                print("Do you Want to Buy another...???....[Y/N]----->")
                @option=gets
        
            end while(@option=~/^[y]+$/)
        
       
end
            