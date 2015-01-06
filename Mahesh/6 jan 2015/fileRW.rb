def readFile(fname)

	#fname="test.txt"
	somefile=File.open(fname,"w")
	somefile.puts"Hello world"
		puts "\n\nFile written sucessfully................"
		somefile.close

			puts "\n\nFile Reading started................"

			somefile=File.open(fname).each do |lines|
			puts lines+"--"
			end
			puts "\n\nFile Reading Completed.................."
			somefile.close

end

readFile("test1.txt")

