module Extend
  def bject_id
   puts "my object id is #{self.object_id}"
  end
end

class Person
  extend ExtendMe
end

Person.object_id