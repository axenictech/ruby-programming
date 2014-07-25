require 'mysql'

class Flight
    attr_accessor :name,:address,:age,:id
    def initialize
        @conn = Mysql.connect("localhost", "root", "root","prateema")
         menu

      rescue Mysql::Error=>e 
        puts "Connection error"

      ensure
        @conn.close
    end  


    def menu
      puts "\n\t\t\tWelcome to IBIBO flight book"
       
      puts "\n\t\t\t 1.Book a flight"
      puts "\n\t\t\t 2.Check available flight"
      puts "\n\t\t\t 3.Check available flight and fare"

      choice=gets.to_i

      case choice
        when 1 then
            accept_details
        when 2 then
            available_flight
        when 3 then
            available_flight_fare
        else
          puts "Wrong choice"

        end



    end

    def accept_name

   puts "Enter name:"        
      @name=gets
   if (@name=~/^[a-zA-Z],{3,15}/) then 
      puts "\t\t\tAccepted"

      accept_address
    else
      puts "\t\t\tThe #{@name} entered is improper PLEASE ENTER A VALID NAME"
      accept_name
    end

    end

      def accept_address

      puts "Enter Address:"        
      @address=gets
   if (@address=~/^[a-zA-Z],{4,16}/) then 
      puts "\t\t\tAccepted"
      accept_age
    else
      puts "\t\t\tThe #{@address} entered is improper PLEASE ENTER A VALID ADDRESS"
      accept_address
    end

    end

def accept_age

      puts "Enter Age:"        
      @address=gets
   if (@address=~/^[0-9],{1,2}/) then 
      puts "\t\t\tAccepted"
      display_details
    else
      puts "\t\t\tThe #{@address} entered is improper PLEASE ENTER A VALID ADDRESS"
      accept_age
    end

    end

def display_details
      insert_in=@conn.prepare("insert into preson_det(name,address,age) values(?,?,?)")
      insert_in.execute(@name,@address,@age)
      insert.commit


      display_insert=@conn.query("select * from booking where name=@name")

          print "\n\t\tNAME \t\tADDRESS\t\tAGE"
          while row=display_insert.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t#{row[1]} \t\t #{row[2]}"
        

end
    def available_flight

      available_f=@conn.query("select source,destination from booking ")

          print "\n\t\tSOURCE \t\tDESTINATION"
          while row=available_f.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t#{row[1]}"
          
          puts "\n"
     end

     def available_flight_fare

        available_ff=@conn.query("select * from booking ")

          print "\n\t\tSOURCE \t\tDESTINATION\t\tFARE"
          while row=available_ff.fetch_row  do 
          print "\n\t\t#{row[0]} \t\t#{row[1]} \t\t #{row[2]}"
          
          puts "\n"
     end

    end

  end 
end

Flight.new

