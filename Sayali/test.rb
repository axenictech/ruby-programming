class Test
 def print
 	toppings = Hash["pancakes"=>"syrup","Pizza"=>"Pepper","Cereal"=>"Sugar"]

        puts toppings.inspect

        toppings.each{|key, value| puts "#{key} points to #{value}"}
  end
  
 def show
 	salaries = Hash["bob",10.9,"larry",7.5,"jimmy",6.0,"jerry",6.5]
         puts salaries.inspect
         mySalaryArray = salaries.select{|name,salary| salary > 7.0}
         puts mySalaryArray.inspect
 end
   end
     Test.new.show



