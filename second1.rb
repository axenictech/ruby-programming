class Second
  def initialize(name,state)
		@name=name
		@state=state

        if (name=~ /^[-a-z]+$/)    #validation for name

                puts "the name is #{name}"
     
         else 
                 puts "Enter Valid Name"
        end 

        
        case state.to_i

                when 0..30 
                 puts "pool"

                when 0..60 
                puts "good"
    
                when 0..90 
                puts "very good"
    
                else
	   puts "Enter valid no " #validation for no
        end

end
end
end

Second.new(gets,gets)