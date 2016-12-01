json.extract! servico, :id, :dataCheckIn, :data, :hora, :TipoServico_id, :Estadia_id, :Quarto_id, :Hotel_id, :created_at, :updated_at
json.url servico_url(servico, format: :json)