# Não gosto de shoes :(

require 'pg'

conn = PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"hotel", :user=>"eu", :password=>'postgres')

query_result_text = ""

conn.exec( "SELECT * FROM cliente" ) do |result|
	query_result_text << "idcliente | nome							| endereco\n"

	result.each do |row|
		row_values = row.values_at('idcliente', 'nome', 'endereco')
		query_result_text << " %8d | %-17s | %s " % row_values << "\n"
	end

end

class	HotelSystem < Shoes
	url '/', :index
	url '/reservas', :reservas
	url '/quartos', :quartos

	def index
		shared
		stack do
			title "Ola"
			background white
		end
	end

	def reservas
		shared
	end

	def quartos
		shared
	end

	def shared
		style(Shoes::Link, :underline => nil)
		style(Shoes::LinkHover, fill: nil, :underline => nil)
		background("#e1e1e1")
		menu_tab "Reservas", "/reservas",	width: 170, height: 30, margin: 2
		menu_tab "Quartos",  "/quartos", width: 170, height: 30, margin: 2
		menu_tab "Clientes", "/",	width: 170, height: 30, margin: 2
	end
end

Shoes.app title: "Hotel Management System", width: 800, height: 600


class MenuTab < Shoes::Widget
	@@tabs = []
	def initialize(label, link, args)
		@@tabs << self
		background white, curve: 5
		para link(label, :stroke => "#777", :fill => nil).
			click { visit link },
				:margin => 2, :align => "center", :size => 12
		hover { expand }
	end
end

class Manager < Shoes::Widget
	@@tabs = []
	def initialize(label, args)
		@@tabs << self
		background white, curve: 5
		para link(label, :stroke => "#999", :fill => nil).
			click { visit "/" },
				:margin => 2, :align => "center", :size => 12
		hover { expand }
	end
end
