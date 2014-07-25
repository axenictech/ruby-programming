# to do programm uder working

require "highline/import"
require "securerandom"
require "openssl"
require "base64"
require "mysql"

class Login

	def initialize
		begin
			@connection=Mysql.connect("localhost","root","mysql","Testdb")
			puts "\n\tRegister here.....!!!"
			print "\n\tEnter your Email-id: "
			@email_id=gets.chomp
			password=ask("\n\tEnter your password: "){|character| character.echo="*"}
			createHash(password)
			register
			login
		rescue Mysql::Error => e
			puts "Error in connection....#{e}"
		ensure 
			@connection.close if @connection
		end
	end

	def createHash(password)
		@salt=SecureRandom.base64(24)
		puts @salt
		pbkdf2=OpenSSL::PKCS5::pbkdf2_hmac_sha1(password,@salt,1000,24)
		puts pbkdf2
		@password=Base64.encode64(pbkdf2)
		puts @password
	end

	def register
		statement=@connection.prepare("insert into login values(?,?,?)")
		statement.execute(@email_id,@password,@salt)
		@connection.commit
		puts "\n\tRegister successfully.....!!!"
	end

	def login
		puts "\n\n\tLogin here.....!!!"
		print "\n\tEnter Username: "
		username=gets.chomp
		password=ask("\n\tEnter Password: "){|character| character.echo=false}

		statement1=@connection.prepare("select password, salt from login where email_id=?")
		statement1.execute(username)
		recordset=statement1.fetch

		if recordset.nil?
			puts "\n\tInvalid Username and Password...!!!"
			login
		else
			login_password=recordset[0]
			login_salt=recordset[1]
			s=Base64.decode64(login_password)
			puts s
			matchHash(password,login_salt)
			if login_password.eql? @login_password
				puts "\n\n\tLogin successfully...!!!\n\n\n"
			else
				puts "\n\tInvalid Username and Password...!!!"
				login
			end
		end
	end

	def matchHash(password,salt)
		pbkdf2=OpenSSL::PKCS5::pbkdf2_hmac_sha1(password,salt,1000,24)
		puts pbkdf2
		@login_password=Base64.encode64(pbkdf2)
		puts @login_password
	end
end

Login.new