json.extract! estadia, :id, :dataCheckIn, :dataCheckOut, :cliente_id, :quarto_id, :hotel_id, :created_at, :updated_at
json.url estadia_url(estadia, format: :json)