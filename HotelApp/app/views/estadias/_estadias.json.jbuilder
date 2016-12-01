json.extract! estadias, :id, :dataCheckIn, :dataCheckOut, :cliente_id, :quarto_id, :hotel_id, :created_at, :updated_at
json.url estadias_url(estadias, format: :json)