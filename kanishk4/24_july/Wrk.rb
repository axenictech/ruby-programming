$LOAD_PATH << '.'
require "mymodule"

class Mywork
include Dates
def work
puts "to complete ruby programming"
end
end

my=Mywork.new
my.display
my.work