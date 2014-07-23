require "pg"

begin

conn = PGconn.connect("localhost", 5432, "", "", "amar")

puts"Got connection........."

end