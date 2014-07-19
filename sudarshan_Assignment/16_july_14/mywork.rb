$LOAD_PATH << '.'
require "mymodule"

class Mywork
include Dates
def work
puts "Today is ruby practice"
end
end

my=Mywork.new
my.display
my.work
