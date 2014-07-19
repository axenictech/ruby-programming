# program for accepting name and grade then  calculate and validate the input and display rating 


    class Assignment4
        
         begin  # this is main loop for continueing till user enter yes.. 

        
            begin #loop for valiating user input until not entering corrct name
                puts
                print("Enter Name:")
                @name=gets
                @len=@name.length
    

                if (@name=~ /^[-a-z]+$/) #check regular expression for correct name
                
                    break  #break  loop if user enter corrcect name

                else        
                    
                    puts"Enter only letters...."

                    
                end 

                
            end while (@name!=~ /^[-a-z]+$/)


                begin  #loop for valiating user input until not entering corrct Rating
                    puts
                    print("Enter Rating:")
                    @rat=gets.to_i

                    if (@rate!=~ /^[-0-9]+$/) #check regular expression for correct rating

                        break #break  loop if user enter corrcect rating
                    else

                        puts"Enter only no......"
                    end

                end while(@rat!=~ /^[-0-9]+$/)
            
        
        
        

        case(@rat) #switch to rating and calculte rating

        when  0..30 
    
            puts("Name: #{@name}Rating: poor....")

        when  31..50
            puts("Name: #{@name}Rating: ok....")

        when  51..60
            puts("Name: #{@name}Rating: good....")  

        when  61..80
            puts("Name: #{@name}Rating: Very Good....")

        when  81..100
            puts("Name: #{@name}Rating: Excellent....")
        else
            puts("Plz enter Number Between/ 0-100")

        end

        
        print("Do you Want to Continue.....[Y/N]----->")
        @option=gets
        
    end while(@option=~/^[y]+$/) # break loop if user enter no...

end
    Assignment4
