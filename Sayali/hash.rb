class Hash
	def print
      months = {"1" => "January", "2" => "February"}
      years ={"3" => "J", "4" => "F"}
      values = months.values
      keys = months.keys
       puts "#{keys}"
     puts "#{values}"
      months.length
      puts "length:",months.length
     months.inspect

     puts "Inspects:",months.inspect
     
     puts "size:",months.size

     puts "merge:",months.merge(years)
      
     puts "Store:",months.store(5, "sai") 
     puts "#{keys}"
     puts "#{values}"
     months.clear
     values.clear 
     puts "Clear:"
    puts "#{keys}"
    puts "#{values}"
    

    





      end

 end
	Hash.new.print
    