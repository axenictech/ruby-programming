class Person

def initialize(fname, lname)

@fname = fname

@lname = lname

end

end

person = Person.new("Augustus","Bondi")

puts person

class Employee < Person

def initialize(fname, lname, position)

super(fname,lname)

@position = position

end

def to_s

super + ", #@position"

end

end

employee = Employee.new("Augustus","Bondi","CFO")

print employee

[:a, :b, :c].include?(:a)print employee.fname