json.extract! reserva, :id, :dataReserva, :dataCheckIn, :dataCheckOut, :ValorEntrada, :Cliente_id, :Quarto_id, :Hotel_id, :created_at, :updated_at
json.url reserva_url(reserva, format: :json)