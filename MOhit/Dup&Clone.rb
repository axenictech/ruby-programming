
class MyClass
	attr_accessor :str
end
module Words
	def words
	'Mohit'
	end
end

a=MyClass.new
a.extend(Words)
a.words

a1=a.clone 
#CLONE COPIES THE WHOLE OBJECT WITH THE EXTENDED METHODS

a1.words

a2=a.dup
a2.words 
#This will give an error that no such method found.


