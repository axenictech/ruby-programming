$LOAD_PATH << '.'

#include the Module first ModuleD.rb
require "ModuleD"

class Ruby
	#access the module world
	include World
   	def wel
   	 	
   	 	puts "Welcome to ruby"
   	end
end

#create the object of Ruby
d=Ruby.new
d.disp
d.wel