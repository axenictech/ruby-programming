def fibonac( n )
    [ n ] if ( 0..1 ).include? n
    ( fibonac( n - 1 ) + fibonac( n - 2 ) ) if n > 1
end

puts fibonac( 5 )