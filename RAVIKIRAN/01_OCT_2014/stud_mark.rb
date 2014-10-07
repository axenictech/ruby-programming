class Student

   def initialize(name,marks)
      @name, @marks = name, marks
   end

   def getName
      @name
   end
   def getMarks
      @marks
   end

   def setName=(value)
      @name = value
   end
   def setMarks=(value)
      @marks = value
   end
end

puts "Enter the name of student : "
name=gets
puts "Enter the marks"
marks=gets
stud = Student.new(name, marks)

stud.setName = name
stud.setMarks = marks

x = stud.getName()
y = stud.getMarks()

case y
   when 0..34
    puts "FAIL"
   when 35..50
    puts "PASS CLASS"
   when 51..54
    puts "SECOND CLASS"
   when 55..59
    puts "HIGHER SECOND CLASS"
   when 60..65
    puts "HIGHER SECOND CLASS"
   else
    puts "DISTINCTION"
end

puts "#{x} YOU HAVE GOT #{y}"
