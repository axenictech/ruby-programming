loop do
print "enter "
line=gets
break if line =~ /^[-a-z]+$/
puts "wrong password"
end
puts "done"
