(1..9).each do |row|
line=""
(1..9).each {|col| line +="#{row*col}\t"} 
puts line
end