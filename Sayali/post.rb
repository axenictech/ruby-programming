require "pg"
class Postgres
  
  def connect
    @conn = PG.connect(
        :dbname => 'Demo',
        :user => 'root',
        :password => 'root')
    puts "connect successfully"
  end
 end
 Postgres.new.connect