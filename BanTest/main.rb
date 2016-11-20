require 'pg'

conn = PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"hotel", :user=>"eu", :password=>'postgres')

conn.exec( "SELECT * FROM cliente" ) do |result|
	puts "idcliente | nome              | endereco"

	result.each do |row|
		row_values = row.values_at('idcliente', 'nome', 'endereco')
		puts " %8d | %-17s | %s " % row_values
	end

end

arr = ["Oi", 10, "como vai"]
puts " %s | %d | %s " % arr
