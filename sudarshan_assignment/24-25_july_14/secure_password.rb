#use salt password hashing concept
#using pcks5, securerandom and base64 concept encode password with salt and stored in database
#at login time current password encode with original salt 
#after that check encoded current password and encoded original password

#use highline/import module to hide password on prompot
require "highline/import"
#use securerandom module for salt value
require "securerandom"
#use to do mixing of password and salt
require "openssl"
#use to encode mixing value
require "base64"
#to coonect with mysql database
require "mysql"

class Login

	def initialize
		begin
	#connection to mysql
			@connection=Mysql.connect("localhost","root","mysql","Testdb")
			puts "\n\tRegister here.....!!!"
			print "\n\tEnter your Email-id: "
	#user email-id
			@email_id=gets.chomp
	#user password 
			password=ask("\n\tEnter your password: "){|character| character.echo="*"}
	#call method to encode password
			createHash(password)
	#call method register
			register
	#call method login
			login
		rescue Mysql::Error => e
			puts "Error in connection....#{e}"
		ensure 
			@connection.close if @connection
		end
	end

	def createHash(password)
	#create salt value for password
		@salt=SecureRandom.base64(24)
	#using PKCS5 mix password and salt 
		pbkdf2=OpenSSL::PKCS5::pbkdf2_hmac_sha1(password,@salt,1000,24)
	#encode mix password
		@password=Base64.encode64(pbkdf2)
	end

	def register
	#excute query
		statement=@connection.prepare("insert into login values(?,?,?)")
		statement.execute(@email_id,@password,@salt)
		@connection.commit
		puts "\n\tRegister successfully.....!!!"
	end

	def login
		puts "\n\n\tLogin here.....!!!"
		print "\n\tEnter Username: "
	#username of user
		username=gets.chomp
	#password of user
		password=ask("\n\tEnter Password: "){|character| character.echo=false}
	#excute query
		statement1=@connection.prepare("select password, salt from login where email_id=?")
		statement1.execute(username)
	#fetch recorde in recordset
		recordset=statement1.fetch
	#check recordset is empty
		if recordset.nil?
			puts "\n\tInvalid Username and Password...!!!"
	#call method login
			login
		else
			login_password=recordset[0]
			login_salt=recordset[1]
	#call method matchHash to encode login_password and salt
			matchHash(password,login_salt)
	#check current password is equal to original password
			if login_password.eql? @login_password
				puts "\n\n\tLogin successfully...!!!\n\n\n"
			else
				puts "\n\tInvalid Username and Password...!!!"
		#call method login
				login
			end
		end
	end

	def matchHash(password,salt)
	#to mixing current password and original salt 
		pbkdf2=OpenSSL::PKCS5::pbkdf2_hmac_sha1(password,salt,1000,24)
	#to ecode current password
		@login_password=Base64.encode64(pbkdf2)
	end
end

Login.new