$LOAD_PATH << ''
require "module"

class Mywork
include Date
def work
puts "Today is ruby practice"
end
end

my=Mywork.new
my.display
my.work
