BEGIN{
    puts "in begin block"
}
BEGIN{
    puts" IN SECOND BEGIN"
}
END{
    puts "in end block"
}
puts "outer block"

END{
  puts "outer END block"
}