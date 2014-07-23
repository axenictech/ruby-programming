class Studentinfo

   attr_reader :stud_name,:stud_class
   attr_accessor:stud_age

 def initialize(stud_name,stud_class,stud_age)

   @stud_name=stud_name
   @stud_class=stud_class
   @stud_age=stud_age
  
 end

end

info=Studentinfo.new("robin","engineering","23")
puts "stud_name= #{info.stud_name}"
puts "stud_class=#{info.stud_class}"
puts "stud_age=#{info.stud_age}"

