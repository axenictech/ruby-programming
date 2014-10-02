
#small application for flite booking
require "mysql" 
class FliteBook

    
             begin
                
               #connet to database 
               con=Mysql.connect("localhost","root","129129129") 
                #check for database if not present then create 
                # use shopping database    
               con.query("CREATE DATABASE IF NOT EXISTS \ FliteBook") 
               con.query("use FliteBook")    

                 #check for database tables if not present 
                 #then create all required tables

               con.query("create table if not exists \ Booked(
                id int(30),name varchar(20),source varchar(20),destination varchar(20),payment int(20),primary key(id))")    

               con.query("create table if not exists \ 
                payment (dest varchar(30),cost int(30)")

             

               res=con.query("select* from payment")

                #check table contents if emptey then
                #insert all required values

               if (row1=res.fetch_row).nil?   

                     con.query("insert into payment values ('kolhapur',2500)")
                     con.query("insert into payment values ('Delhi',7600)")
                     con.query("insert into payment values ('chennai',5567)")
                     con.query("insert into payment values ('benglore',4689)")
                    
                    
                end

            rescue Exception => e   

                puts e
                    
                    
            end


          begin 
                #displaying menu
                puts"......................Welcome To Air India......................."
                puts"1.Book Flight"
                puts"2.Cancle Ticket"
                puts"3.Exit"
                puts "Enter your choice.."
                choice=gets.to_i
                
                
                id=1
                #switch to user choice 
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

                
                             end while (name!=~ /^[-a-z]+$/)#continue until not getting correct input 


                            begin 
                                    # getting  source city from user 
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

                            end while(f!=~ /^[-0-4]+$/) #continue until not getting correct input 
            
                                #set source delhi and get payment from  payment table
                                if(from==1)
                                        source="Delhi"
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("Delhi")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                #set source chenni and get payment from  payment table        
                                elsif(from==2)
                                        source="Chennai"
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("chennai")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                 #set source kolhapur and get payment from  payment table       
                                elsif(from==3)
                                        source="kolhapur"   
                                        res=con.prepare("select cost from payment where dest=?")
                                        res.execute("kolhapur")
                                        while row=res.fetch do
                                                    payment=row[0]
                                        end 
                                 #set source benglore and get payment from  payment table       
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
                            puts"Your ticket has been Canceled successfully......"
                                            

                when 3
                            break
                else
                        puts("wrong choice.....")
                end
                print("Do you Want to Continue to Book Another Ticket.....[Y/N]----->")
                @option=gets
        
            end while(@option=~/^[y]+$/)
        
       
        
end
            