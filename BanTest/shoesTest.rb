require 'pg'

conn = PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"hotel", :user=>"eu", :password=>'postgres')

query_result_text = ""

conn.exec( "SELECT * FROM cliente" ) do |result|
	query_result_text << "idcliente | nome              | endereco\n"

	result.each do |row|
		row_values = row.values_at('idcliente', 'nome', 'endereco')
		query_result_text << " %8d | %-17s | %s " % row_values << "\n"
	end

end


Shoes.app(title: "Hotel Management System") do
	background("#DDD")
	# border("#555", strokewidth: 6, radius: 12)
	stack(margin: 5, width: "100%") do
		background("#FFF")
		title "I'm a little shoe!"
	end

	stack(margin: 5, width: "20%") do
		background("#FFF")
		para "Oi " * 50
	end
	stack(margin: 5, width: "80%") do
		background("#FFF")
		para query_result_text
	end
end
