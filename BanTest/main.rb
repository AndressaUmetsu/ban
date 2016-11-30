require 'pg'
require "gtk3"

conn = PGconn.connect( :hostaddr=>"127.0.0.1", :port=>5432, :dbname=>"hotel", :user=>"eu", :password=>'postgres')

conn.exec( "SELECT * FROM cliente" ) do |result|
	puts "idcliente | nome              | endereco"

	result.each do |row|
		row_values = row.values_at('idcliente', 'nome', 'endereco')
		puts " %8d | %-17s | %s " % row_values
	end

end

app = Gtk::Application.new("org.gtk.example", :flags_none)

app.signal_connect "activate" do |application|
  window = Gtk::ApplicationWindow.new(application)
  window.set_title("Window")
  window.set_default_size(200, 200)

  button_box = Gtk::ButtonBox.new(:horizontal)
  window.add(button_box)

  button = Gtk::Button.new(label: "Hello World")
  button.signal_connect "clicked" do |widget|
    puts "Hello World"
    window.destroy
  end

  button_box.add(button)

  window.show_all
end

# Gtk::Application#run need C style argv ([prog, arg1, arg2, ...,argn]).
# The ARGV ruby variable only contains the arguments ([arg1, arg2, ...,argb])
# and not the program name. We have to add it explicitly.

puts app.run([$0] + ARGV)
